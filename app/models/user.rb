# frozen_string_literal: true

class User < ApplicationRecord

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  private

  def downcase_email
    email.downcase!
  end

end
