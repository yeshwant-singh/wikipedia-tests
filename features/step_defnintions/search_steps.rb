
Given /^I am on home page$/ do
  @home_page = HomePage.new(@browser)
  @home_page.visit
end

When /^I search for ([a-zA-Z ]+) in (\w+)$/ do |search_term, language|
 @landing_page = @home_page.search(search_term, language)
end

Then /^I see the ([a-zA-Z 0-9]+) page$/ do |expected|
 @landing_page.article_heading.should == "India" 
end

