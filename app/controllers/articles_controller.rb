class ArticlesController < ApplicationController
  def index
    response = ApiService.fetch_data
    if response.success?
      @articles = response.parsed_response.fetch("articles")
    else 
      @error_message = "Error fetching data from the API: #{response.code}"
    end
  end
end
