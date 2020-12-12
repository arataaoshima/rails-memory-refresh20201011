class NotificationMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "お問い合わせフォームが送信されました", #メールのタイトル
      to: @user #宛先
    ) do |format|
      format.text
    end
  end
end
