# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :course_passages, dependent: :destroy
  has_many :users, through: :course_passages
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (name) { joins(:category).where(categories: { title: name }) }


  def self.titles_by_category(category_title)
    joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
