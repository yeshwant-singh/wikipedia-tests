class MainPage

  include DriverHelper

  def initialize(browser)
    @browser = browser
  end

  def visit
    navigate("http://en.wikipedia.org/wiki/Main_Page")
  end

  def heading_displayed?(heading) 
    element_displayed?({:xpath => "//span[@class='mw-headline'][text()=\"#{heading}\"]"})
  end

end
