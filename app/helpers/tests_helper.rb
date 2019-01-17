# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    header = test.new_record? ? 'Create new' : 'Edit'
    "#{header} #{test.title} Test"
  end
end
