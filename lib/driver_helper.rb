module DriverHelper

  def navigate(url)
    @browser.navigate.to(url)
  end

  def element_displayed?(locator)
    get_element(locator).displayed?
  end
  
  def get_element(locator)
    arr = locator.first
    @browser.find_element(arr[0], arr[1])
  end

  def click_element(locator)
    element = get_element(locator)
    element.click
  end

  def text(locator)
    el = get_element(locator)
    el.text
  end

  def enter_text(locator, text)
  el = get_element(locator)
  el.send_keys(text)
  end

  def select_option(locator_drop_down, option)
    drop_down = get_element(locator_drop_down)
    Selenium::WebDriver::Support::Select.new(drop_down).select_by(:text, option)
  end

end
