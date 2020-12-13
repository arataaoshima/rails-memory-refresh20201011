class ChargesController < ApplicationController

  def new
  end

  def create

    if current_user.stripe_id == nil
      customer = Stripe::Customer.create({
        email: current_user.email,
        source: params[:stripeToken],
      })
    else
      customer = ::Stripe::Customer.retrieve(current_user.stripe_id)
    end

    subscription = Stripe::Subscription.create({
    customer: customer.id,
    plan: "price_1HBpw0A2USbJix7fP0PGUrXp"
    })

    #saving user info
    current_user.payment = true
    current_user.stripe_id = customer.id
    current_user.subscription_id = subscription.id
    current_user.joined_payment_at = subscription.created

    current_user.save
    flash[:notice] = "有料会員登録ありがとうございます。引き続き学習をお楽しみ下さい。"

    NotificationMailer.send_confirm_payment(current_user).deliver
    redirect_to courses_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to "new_charge_path"
   end

   def unsubscribe
      subscription = Stripe::Subscription.update(
      current_user.subscription_id,
      {
        cancel_at_period_end: true,
      })

      current_user.payment = false
      current_user.canceled_at = subscription.canceled_at
      current_user.current_payment_period_start_at =subscription.current_period_start
      current_user.current_payment_period_end_at = subscription.current_period_end
      current_user.save
      flash[:notice] = "有料会員プランの購読が終了しました。#{Time.at(current_user.current_payment_period_end_at).in_time_zone("Tokyo").to_datetime.strftime('%Y年 %m月 %d日')}に現在の購読期間が終わるまで引き続きサービスをご利用頂けます。"

     NotificationMailer.send_confirm_unsubscribe(current_user).deliver
      redirect_to courses_path
   end
end
