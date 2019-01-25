# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:path] = request.url
      redirect_to login_path, alert: 'Are u guru?'
    end
  end
end
