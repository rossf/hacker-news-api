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
  
  def mode
    occurances = Hash.new(0)
    @stories.each do |story|
      occurances[story["points"]] += 1
    end
    puts "occurances #{occurances}"
    scores = occurances.values.sort
    most_common = scores.last
    puts "most common #{most_common}"
    mode_hash = occurances.select{|points,score| score==most_common}
    puts "mode_hash #{mode_hash}"
    @mode = mode_hash.keys
    return @mode
  end
end