# frozen_string_literal: true

module EventsHelper
  def reward_badge(test_passage)
    badge = BadgeService.new(test_passage).call
    unless badge.empty?
      current_user.badges << badge
      flash[:notice] = t('services.badge.success')
    end
  end
end
