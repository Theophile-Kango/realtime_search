class ArticlesController < ApplicationController
  before_action :get_articles, only: [:update_search_logs]
  before_action :get_ip_address, only: [:update_search, :search_results]


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
    query = {ip_address: @ip_address, search_query: params[:query]}
    UpdateSearchLogsJob.perform_later(query) if query.present?
    head :no_content
  end

  def search_results
    @top_searches = SearchLog.group(:search_query).order('count_search_query DESC').limit(5).count(:search_query)
    @search_user_results = SearchLog.where(ip_address: @ip_address)
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

  def get_ip_address
    ip = Socket.ip_address_list.detect{ |intf| intf.ipv4_private? }
    @ip_address = ip&.ip_address
  end


end


