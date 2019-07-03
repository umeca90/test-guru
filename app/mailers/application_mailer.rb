# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %('TestGuru' <umeca90@gmail.com>)
  layout 'mailer'
end
