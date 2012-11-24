require 'json'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'hacker_news'

Given /^hacker_news$/ do
  @hacker_news = HackerNews.new
end

When /^I download <(.*)>$/ do |n|
  @response = @hacker_news.download(n.to_s)
end

Then /^the response is not an error$/ do
  @response.code==200
end

Then /^the response is a JSON string$/ do
  JSON.parse(@response.to_str)
end