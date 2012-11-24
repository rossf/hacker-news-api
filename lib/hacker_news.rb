require 'rest_client'

class HackerNews
  def response
    @response
  end
    
  def download(url='http://api.ihackernews.com/page')
    @response = RestClient.get url
  end
  
end