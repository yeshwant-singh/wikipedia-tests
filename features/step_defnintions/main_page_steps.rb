
Given /^I am on main page$/ do
  @main_page = MainPage.new(@browser)
  @main_page.visit
end


Then /^Headings are displayed$/ do |table|
    table.raw.each do |heading|
      @main_page.heading_displayed?(heading[0].to_s).should be true
    end
end
