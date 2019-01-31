# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    unless current_user.admin?
      redirect_to root_path, alert: 'You r not authorized for this'
    end
  end
end
