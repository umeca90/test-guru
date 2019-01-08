# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
   Test.joins("INNER JOIN results ON results.test_id = tests.id AND results.user_id = #{self.id}").where(level: level)
  end
end
