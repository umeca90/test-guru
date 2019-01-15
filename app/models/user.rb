# frozen_string_literal: true

class User < ApplicationRecord
  has_many :course_passages, dependent: :destroy
  has_many :tests, through: :course_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def tests_by_level(level)
    tests.by_level(level)
  end

  private

  def downcase_email
    email.downcase!
  end
end
