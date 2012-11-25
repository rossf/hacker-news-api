require 'json'
require 'hacker_news'

Given /^a Hacker News$/ do
  @hacker_news = HackerNews.new
end

When /^I download <(.*)>$/ do |n|
  @response = @hacker_news.download(n.to_s)
end

Then /^the response is not an error$/ do
  (200..207).should include(@response.code) 
end

Then /^the response is a JSON string$/ do
  lambda {JSON.parse(@response.to_str)}.should_not raise_error
end

Then /^the response is an error$/ do
  (200..207).should_not include(@response.code)
end