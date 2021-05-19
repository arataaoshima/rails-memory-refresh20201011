class Users::Mailer < Devise::Mailer

  helper :application

  def reset_password_instructions(record, token, opts={})
  # customize
  super
end

end
