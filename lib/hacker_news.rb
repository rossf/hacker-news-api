require 'rest_client'
require 'json'

class HackerNews
  def response
    @response
  end
    
  def download(url='http://api.ihackernews.com/page')
    begin
      @response = RestClient.get url
    rescue RestClient::Exception => re
       @response = re.response
    end
  end
  
  def parse_response
    @stories = JSON.parse(@response.to_str)["items"]
  end
  
  def mean
    total = 0
    @stories.each do |story|
      points = story["points"]
      total += points.to_i
    end
    @mean = total/@stories.length
  end
end