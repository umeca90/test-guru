# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def result
    (100.00 / test.questions.size) * correct_questions
  end

  def passed?
    result >= 85
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record? && test.present?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
