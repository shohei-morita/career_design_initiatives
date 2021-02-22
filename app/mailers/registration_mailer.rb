class RegistrationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.approval.subject
  #
  def approval(recruiter, password)
    @recruiter = recruiter
    @password = password
    mail(
      subject: 'アカウントが承認されました',
      to: recruiter.email
    )
  end

  def reissue(recruiter, password)
    @recruiter = recruiter
    @password = password
    mail(
      subject: 'パスワードを再発行しました',
      to: recruiter.email
    )
  end
end
