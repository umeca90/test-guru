# frozen_string_literal: true

class CoursePassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
