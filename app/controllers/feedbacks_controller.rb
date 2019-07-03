# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.feedback_mail(@feedback, current_user).deliver_now
      redirect_to root_path, notice: t('.feedback')
    else
      render :new, notice: t('.failure')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
