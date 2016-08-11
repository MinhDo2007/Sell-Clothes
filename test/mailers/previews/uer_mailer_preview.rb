# Preview all emails at http://localhost:3000/rails/mailers/uer_mailer
class UerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/uer_mailer/signup_confirmation
  def signup_confirmation
    UerMailer.signup_confirmation
  end

end
