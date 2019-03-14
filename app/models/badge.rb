# frozen_string_literal: true

class Badge < ApplicationRecord
  BADGES = %w[first_try_complete? whole_category_complete? all_by_level?].freeze

  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

  validates :name, :image, :award_rule, presence: true
  validates :name, uniqueness: true
end
