require 'mailer'

Then /^I get all the stories with a score greater than the median$/ do
  @mail_stories = @hacker_news.stories_with_score_greater_than(@median)
end

Then /^I send an email to "(.*?)"$/ do |arg1|
  mailer = Mailer.new
  mailer.send(arg1, @mean, @mode, @median, @mail_stories)
end

Then /^"(.*?)" should recieve an email$/ do |email_address|
  unread_emails_for(email_address).size.should == 1
end