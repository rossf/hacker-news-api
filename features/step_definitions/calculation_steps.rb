Then /^extract the stories$/ do
 @stories = @hacker_news.parse_response
end

Then /^calculate the mean score of all the stories$/ do
  mean = @hacker_news.mean
end

Then /^calculate the mode of the score of all the stories$/ do
  mode = @hacker_news.mode
end