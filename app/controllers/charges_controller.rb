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

    current_user.payment = true
    current_user.stripe_id = customer.id
    current_user.subscription_id = subscription.id
    current_user.joined_payment_at = subscription.created
    current_user.current_payment_period_start_at =subscription.current_period_start
    current_user.current_payment_period_end_at = subscription.current_period_end

    current_user.save

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
      current_user.save

      redirect_to courses_path

   end
end
