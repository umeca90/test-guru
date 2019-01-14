# frozen_string_literal: true

class User < ApplicationRecord
    has_many :course_passages, dependent: :destroy
    has_many :tests, through: :course_passages
    has_many :created_tests, class_name: 'Test', foreign_key: :author_id


  def tests_by_level(level)
   #Test.joins("INNER JOIN results ON results.test_id = tests.id AND results.user_id = #{self.id}").where(level: level)
   tests.where(level: level)
  end
end
