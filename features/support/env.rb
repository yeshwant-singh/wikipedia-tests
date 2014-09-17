require 'allure-cucumber'
require "selenium-webdriver"
require  File.join(File.dirname(__FILE__), '..', '..', 'lib', 'driver_helper')
 
include AllureCucumber::DSL

if ENV['REMOTE'] == "true" 

  url = "http://#{ENV['HUB_USERNAME']}:#{ENV['AUTH_KEY']}@#{ENV['HUB_NAME']}.browserstack.com:#{ENV['HUB_PORT']}/wd/hub"
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities['os'] = ENV['OS']
  capabilities['os_version'] = ENV['OS_VERSION']
  capabilities['browser'] = ENV['BROWSER']
  capabilities['browser_version'] = ENV['BROWSER_VERSION']
  capabilities['build'] = ENV['BUILD'] || "Testing Parallel"
  capabilities['browserstack.debug'] = 'true'

  browser = Selenium::WebDriver.for(:remote, :url => url,
                                  :desired_capabilities => capabilities)


elsif ENV['LOCAL'] == "true"
  browser = Selenium::WebDriver.for :chrome 
	AllureCucumber.configure do |c|
  	 c.output_dir = "gen/allure-artifacts"
	end
end

Before do |scenario|
  browser.manage.window.maximize
  browser.manage.timeouts.page_load = 60
  @browser = browser
end

After do |scenario|
   browser.save_screenshot('screen.png')
   attach_file('screenshot', File.open("screen.png"))
end

at_exit do
  browser.quit
end


