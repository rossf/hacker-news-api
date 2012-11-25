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
    return nil if(!@response || @response.empty?)

    @stories = JSON.parse(@response.to_str)["items"]
  end
  
  def mean
    return nil if(!@stories || @stories.empty?)

    total = 0
    @stories.each do |story|
      points = story["points"]
      total += points.to_i
    end
    @mean = total/@stories.length
  end
  
  def mode
    return nil if(!@stories || @stories.empty?)
    
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
  
  def median
    return nil if(!@stories || @stories.empty?)
    
    points = Array.new
    @stories.each do |story|
      points.push(story["points"])
    end
    sorted = points.sort
    puts "points array #{sorted}"
    mid = sorted.size/2
    if(sorted.size.even?)
      @median = (sorted[mid] + sorted[mid-1]) / 2 
    else
      @median = sorted[mid]
    end
    puts "median #{@median}"
    return @median
  end
  
  def stories_with_score_greater_than(points_threshold)
    interesting_stories = Array.new
    @stories.each do |story|
      if story["points"].to_i > points_threshold
        interesting_stories.push story
      end
    end
    return interesting_stories
  end
end