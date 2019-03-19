# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PASSING_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  scope :success, -> { where('score >= ?', PASSING_SCORE) }

  before_validation :before_validation_set_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if !test.timer? || remaining_time.positive?
      self.correct_questions += 1 if correct_answer?(answer_ids)
      self.current_question = next_question
      save!
    else
      self.current_question = nil
    end
  end

  def result
    (100.00 / test.questions.size) * correct_questions
  end

  def save_result
    update!(score: result)
  end

  def passed?
    result >= PASSING_SCORE
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def remaining_time
    (self.created_at + test.timer.minutes - Time.current).to_i
  end

  private

  def before_validation_set_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
