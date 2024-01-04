class ArticlesController < ApplicationController
  before_action :get_articles, only: [:update_search_logs]
  def index
    response = ApiService.fetch_data
    if response.success?
      @articles = response.parsed_response.fetch("articles")
      @articles = @articles.select { |article| article.fetch("title")&.downcase&.include?(params[:search]&.downcase) } if params[:search].present?
    else 
      @error_message = "Error fetching data from the API: #{response.code}"
    end
  end

  def update_search_logs
    @query = params[:query]
    @articles = @articles.select { |article| article.fetch("title")&.downcase&.include?(@query&.downcase) } if @query.present?
    ActionCable.server.broadcast("SearchLogsChannel", { articles: @articles, query: @query })
    respond_to do |format|
      format.js
    end
  end

  def update_search
    query = params[:query]
    UpdateSearchLogsJob.perform_later(query) #if query.present?
    head :no_content
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


