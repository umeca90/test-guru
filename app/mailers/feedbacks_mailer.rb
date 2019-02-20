class FeedbacksMailer < ApplicationMailer

  default to: -> { Admin.pluck(:email) }

  def feedback_mail(feedback, user)
    @user = user
    @feedback = feedback

    mail from: @user.email
  end
end
