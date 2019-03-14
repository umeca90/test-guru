# frozen_string_literal: true

class TestPassagesController < ApplicationController
  include EventsHelper

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      Gist.create!(user: @test_passage.user, question: @test_passage.current_question, url: result.gist_url)
      flash[:notice] = view_context.link_to(t('.services.gist.success'), result.gist_url, target: :blank)
    else
      flash[:alert] = t('.services.gist.failure')
    end

    redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.save_result
      reward_badge(@test_passage) if @test_passage.passed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
