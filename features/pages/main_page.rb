require "driver_helper"

class MainPage
  include DriverHelper

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.navigate.to("http://en.wikipedia.org/wiki/Main_Page")
  end

  def heading_displayed?(heading) 
    element_displayed?(@browser, :xpath => "//span[@class='mw-headline'][text()=\"#{heading}\"]")
  end

end
