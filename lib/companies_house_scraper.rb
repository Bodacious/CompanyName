module CompaniesHouseScraper

  require "net/http"
  
  class << self 
    
    def token
      @token ||= "71b81fa94420ae97a73412881db782b2"
    end
    
    def http_object
      @http_object ||= Net::HTTP.new("wck2.companieshouse.gov.uk")
    end
    
    def search(term)
      data, response = http_object.request_post("/71b81fa94420ae97a73412881db782b2/companysearch", "cname=term")
      url = response.match(/companysearch\?disp\=1\&amp\;frfsh\=\d+\#result/)
      get(url.to_s)
    end
    
    def get(url)
      http_object.request_get(url)
    end
    
  end
  
end

data, response = CompaniesHouseScraper.search("AA")
puts response