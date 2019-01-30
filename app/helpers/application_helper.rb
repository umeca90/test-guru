# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'TestGuru'
    if page_title.empty?
      base_title
    else
      page_title + '|' + base_title
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  private

  def welcome_message
    "Welcome #{ current_user.email } Guru" if user_signed_in?
  end
end
