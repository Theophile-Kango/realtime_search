class ApiService
  include HTTParty
  base_uri 'https://newsapi.org'
  
  def self.fetch_data
    api_key = ENV['API_KEY']
    get("/v2/everything?q=tesla&from=2023-12-04&sortBy=publishedAt&apiKey=#{api_key}")
  end
end
  