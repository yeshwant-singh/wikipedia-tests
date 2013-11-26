module DriverHelper

  def element_displayed?(browser, locator)
    find_element(browser, locator).displayed?
  end
  
  def find_element(browser, locator)
    browser.find_element(locator)
  end

end
