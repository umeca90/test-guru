# frozen_string_literal: true

module EventsHelper
  def check_reward(test_passage)
    badges = BadgeService.new(test_passage).call
    unless badges.empty?
      current_user.badges << badges
      flash[:notice] = t('services.badge.success')
    end
  end
end
