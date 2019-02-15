class FeedbacksMailer < ApplicationMailer

  def feedback_mail(feedback, user)
    @user = user
    @feedback = feedback

    mail to: 'umeca90@gmail.com', from: @user.email
  end

end
