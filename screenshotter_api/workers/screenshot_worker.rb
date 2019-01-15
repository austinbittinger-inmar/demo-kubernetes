require 'sidekiq'
require 'securerandom'

class ScreenshotWorker
  include Sidekiq::Worker

  def perform(url)
    puts("Screenshotting #{url}")
    driver.visit(url)
    driver.save_screenshot(filename)
    Screenshot.create(
      url: url,
      base64: Base64.strict_encode64(File.read(filename)),
      time: Time.now
    )
  ensure
    driver.driver.quit
  end

  private

  def driver
    return @driver if @driver
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(
        app,
        browser: :remote,
        url: ENV['CHROME_PORT_SERVER']
      )
    end

    @driver = Capybara::Session.new(:selenium)
  end

  def filename
    @filename ||= '/tmp/' + SecureRandom.hex(16) + '.png'
  end
end
