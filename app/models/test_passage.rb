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
    (100.to_f/test.questions.size) * correct_questions
  end

  def passed?
    result > 84
  end

  def question_number
    test.questions.size - test.questions
                              .order(:id)
                              .where('id > ?', current_question.id).size
  end

  private

  def before_validation_set_question
    if completed? && test.present?
      self.current_question = test.questions.first
    else
      self.current_question = test.questions.order(:id)
                                  .where('id > ?', current_question.id).first
    end
  end


  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
