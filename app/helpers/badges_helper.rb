module BadgesHelper

  def not_earned_badges
    @badges - @user_badges
  end

end
