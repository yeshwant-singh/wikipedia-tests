require "selenium-webdriver"
 
if ENV['REMOTE'] == "true" 
  caps = Selenium::WebDriver::Remote::Capabilities.new("browserstack.debug" => "true", :platform => "WINDOWS", :browser => "chrome")
 browser = Selenium::WebDriver.for(:remote, :url => "http://#{ENV['HUB_USERNAME']}:#{ENV['AUTH_KEY']}@#{ENV['HUB_NAME']}.browserstack.com:#{ENV['HUB_PORT']}/wd/hub", :desired_capabilities => caps)

elsif ENV['LOCAL'] == "true"
  browser = Selenium::WebDriver.for :chrome 
end

Before do |scenario|
  browser.manage.window.maximize
  @browser = browser
end

After do |scenario|

end

at_exit do
  browser.quit
end


