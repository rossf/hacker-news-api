require './lib/hacker_news'

hacker_news = HackerNews.new
response = hacker_news.download

if(response.code!=200)
  puts "Error downloading news. Try again later"
else
  hacker_news.parse_response
  puts "mean #{hacker_news.mean}"
  puts "mode #{hacker_news.mode}"
  puts "median #{hacker_news.median}"
end