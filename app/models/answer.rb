# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true
  scope :correct, -> { where(correct: true) }

  validates :body, presence: true, length: { maximum: 50 }
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:question, 'max 4 answers') if question.answers_count >= 4
  end
end
