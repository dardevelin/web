Given /I visit the blog subdomain/ do
  Capybara.default_host = "http://blog.lvh.me" #for Rack::Test
  Capybara.app_host = "http://blog.lvh.me:9887" if Capybara.current_driver == :selenium
  visit '/'
end
Given /I am on the base subdomain/ do
  Capybara.default_host = "http://lvh.me" #for Rack::Test
  Capybara.app_host = "http://lvh.me:9887" if Capybara.current_driver == :selenium
  visit '/'
end
