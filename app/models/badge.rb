class Badge < ApplicationRecord

  has_many :users, through: :user_badges
  has_many :badges, dependent: :destroy

  validates :name, :image, :award_rule, :badge_param, presence: true

end
