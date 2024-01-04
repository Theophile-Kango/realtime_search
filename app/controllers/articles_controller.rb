class ArticlesController < ApplicationController
  before_action :get_articles, only: [:index, :update_search_logs]

  def index; end

  def update_search_logs
    @query = params[:query]
    @articles = @articles.select { |article| article.fetch("title")&.downcase&.include?(@query&.downcase) } if @query.present?
    ActionCable.server.broadcast("SearchLogsChannel", turbo_stream: turbo_stream.replace("remote_articles", partial: "articles/articles", locals: { articles: @articles }))
  end

  private 

  def get_articles
    response = ApiService.fetch_data
    if response.success?
      @articles = response.parsed_response.fetch("articles")
    else 
      @error_message = "Error fetching data from the API: #{response.code}"
    end
  end

end
