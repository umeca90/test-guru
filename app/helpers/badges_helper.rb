module BadgesHelper

  def not_earned_badges
    @badges - @user_badges
  end

  def award_rule_name
    Badge::BADGE_TYPE.map { |rule| [t(rule, scope: 'admin.badges.form.award_rule_name'), rule] }
  end

end
