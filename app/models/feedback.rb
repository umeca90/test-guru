# frozen_string_literal: true

class Feedback
  include ActiveModel::Model

  attr_accessor :body

  validates :body, presence: true
end
