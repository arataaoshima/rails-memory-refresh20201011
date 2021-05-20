class NotificationMailer < ActionMailer::Base
  default from: 'info@smorq.com'



  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "お問い合わせフォームが送信されました",
      to: @user #宛先
    ) do |format|
      format.text
    end
  end



  def send_confirm_payment(user)
    @user = user.email
    mail(
      subject: "有料会登録ありがとうございます",
      to: @user #宛先
    ) do |format|
      format.text
    end
  end


  def send_confirm_unsubscribe(user)
    @user = user.email
    mail(
      subject: "有料会員プランの購読が終了しました",
      to: @user #宛先
    ) do |format|
      format.text
    end
  end


  def receive_inquiry(user)
     @user = user.email
    mail(
      subject: "お問い合わせフォームを受け取りました",
      to: "info@smorq.com"
    ) do |format|
      format.text
    end
  end

end
