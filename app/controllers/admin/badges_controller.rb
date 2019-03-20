# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index update_inline]
  before_action :set_badge, only: %i[show edit update destroy update_inline]

  def index; end

  def new
    @badge = Badge.new
  end

  def show; end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success_new')
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: t('.success_update')
    else
      render :edit
    end
  end

  def update_inline
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success_update')
    else
      render :index
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success_delete')
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image, :award_rule, :badge_param)
  end
end
