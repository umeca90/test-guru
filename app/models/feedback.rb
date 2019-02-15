class Feedback

  include ActiveModel::Model

  attr_accessor :body, :id

  validates :body, presence: true



end