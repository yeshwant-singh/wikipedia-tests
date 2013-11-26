class LandingPage 

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.navigate.to "http://en.wikipedia.org/wiki/India"
  end

  def article_heading 
    @browser.find_element(:id, "firstHeading").text
  end
  
end
