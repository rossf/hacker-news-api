Then /^extract the stories$/ do
 @stories = @hacker_news.parse_response
end

Then /^calculate the mean score of all the stories$/ do
  @mean = @hacker_news.mean
  @mean.should be_a_kind_of(Fixnum)
end

Then /^calculate the mode of the score of all the stories$/ do
  @mode = @hacker_news.mode
  @mode.should be_a_kind_of(Array)
end

Then /^calculate the median of the score of all the stories$/ do
  @median = @hacker_news.median
  @median.should be_a_kind_of(Fixnum)
end