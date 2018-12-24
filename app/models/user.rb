class User < ApplicationRecord

  def tests_by_level(level)
    Test.joins("INNER JOIN results").where(results: {user_id: self.id}).where("level = ?", level).distinct
  end

end
