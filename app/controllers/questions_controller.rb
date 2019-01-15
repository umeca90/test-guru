# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @test.questions.pluck(:body)
    render plain: result.join("\n")
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render 'new'
    end
  end

  def destroy
    question = @question.destroy
    render plain: "Question '#{question.body}' has been deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
