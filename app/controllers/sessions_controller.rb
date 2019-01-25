class SessionsController < ApplicationController

  before_action :set_user, only: :create

  skip_before_action :authenticate_user!

  def new

  end

  def create
    if @user&.authenticate(params[:password])
      log_in(@user)
      #redirect_to tests_path
      redirect_to cookies.fetch(:path, tests_path)
    else
      flash.now[:alert] = 'Invalid data'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  private

  def set_user
    @user = User.find_by(email: params[:email].downcase)
  end

end
