require './lib/hacker_news'
require './lib/mailer'

hacker_news = HackerNews.new
response = hacker_news.download

if(response.code!=200)
  puts "Error downloading news. Try again later"
else
  hacker_news.parse_response
  mean = hacker_news.mean
  puts "mean #{mean}"
  mode = hacker_news.mode
  puts "mode #{mode}"
  median = hacker_news.median
  puts "median #{median}"
  stories = hacker_news.stories_with_score_greater_than(median)
  puts stories
  mailer = Mailer.new
  mailer.send("test@email.com", mean, mode, median, stories)
end