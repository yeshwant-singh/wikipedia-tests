class HomePage

 include DriverHelper

   def initialize(browser)
    @browser = browser
   end

   def visit
    navigate("http://www.wikipedia.org/")
   end

  def search(search_term, language = "English")
    enter_search_term(search_term)
    select_language(language)
    click_go_button
    LandingPage.new(@browser)
  end

  def enter_search_term(search_term)
    enter_text({:name => "search"}, search_term)
  end

  def select_language(language)
    select_option({:name => "language"}, language)
   end

  def click_go_button
    click_element({:name => "go"})
  end

end
