# frozen_string_literal: true

module GistsHelper
  def gist_hash(url)
    url.split('/').last
  end
end
