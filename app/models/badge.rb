# frozen_string_literal: true

class Badge < ApplicationRecord

  BADGE_TYPE = %w[first_try_complete? whole_category_complete? all_by_level?].freeze

  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

  scope :by_param, ->(param) { where(badge_param: param) }

  validates :name, :award_rule, presence: true
  validates :image, presence: true, format: URI::regexp(%w(http https))
  validates :name, uniqueness: true
  validates :award_rule, uniqueness: { scope: :badge_param }

end
