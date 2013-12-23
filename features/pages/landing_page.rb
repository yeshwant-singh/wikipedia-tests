class LandingPage 

  include DriverHelper

  def initialize(browser)
    @browser = browser
  end

  def visit
    navigate("http://en.wikipedia.org/wiki/India")
  end

  def article_heading 
    text({:id => "firstHeading"})
  end
  
end
