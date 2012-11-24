require './lib/hacker_news'

hacker_news = HackerNews.new
response = hacker_news.download
puts response
if(response.code!=200)
  puts "Error downloading news"
else
  hacker_news.parse_response
  puts hacker_news.mean
end