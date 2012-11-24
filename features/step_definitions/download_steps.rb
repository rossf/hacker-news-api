require 'json'
require 'hacker_news'

Given /^hacker_news$/ do
  hacker_news = HackerNews.new
end

When /^I download (.*)$/ do |n|
  response = hacker_news.download(n)
end

Then /^the response is not an error$/ do
  response.status==200
end

Then /^the response is a JSON string$/ do
  JSON.parse(response.result)
end