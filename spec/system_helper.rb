# frozen_string_literal: true

require "rails_helper"
require "capybara/cuprite"

Capybara.default_max_wait_time = 2
Capybara.default_normalize_ws = true

Capybara.register_driver(:cuprite_chromium) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    **{
      window_size: [1200, 800],
      # See additional options for Dockerized environment in the respective section of this article
      browser_options: {},
      # Increase Chrome startup wait time (required for stable CI builds)
      process_timeout: 10,
      # Enable debugging capabilities
      inspector: true,
      # Allow running Chrome in a headful mode by setting HEADLESS env
      # var to a falsey value
      headless: !ENV["HEADLESS"].in?(%w[n 0 no false])
    }
  )
end

Capybara.default_driver = :cuprite_chromium
Capybara.javascript_driver = Capybara.default_driver

RSpec.configure do |config|
  config.prepend_before(:each, type: :system) do
    driven_by Capybara.javascript_driver
  end
end
