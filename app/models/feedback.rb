class Feedback

  include ActiveModel::Model

  attr_accessor :body, :id

  validates :body, presence: true

  def initialize(id = 1)
    @id = 1
  end

end