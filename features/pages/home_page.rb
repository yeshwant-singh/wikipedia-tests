#require "selenium-webdriver"

class HomePage

 #include DriverHelper

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.navigate.to "http://www.wikipedia.org/"
  end

  def search(search_term, language = "English")
    enter_search_term(search_term)
    select_language(language)
    click_go_button
    LandingPage.new(@browser)
  end

  def enter_search_term(search_term)
    @browser.find_element(:name, "search").send_keys(search_term)
  end

  def select_language(language)
    el_language = @browser.find_element(:name, "language")
    el_option = el_language.find_element(:xpath, ".//option[text()='#{language}']")
    el_option.click
  end

  def click_go_button
    @browser.find_element(:name, "go").click
  end

end
