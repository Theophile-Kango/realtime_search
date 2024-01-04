class SearchLogsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "SearchLogsChannel"
  end

  def update(data)
    query = data["query"]
    articles = ApiService.fetch_data.parsed_response.fetch("articles")
    byebug
    filtered_articles = articles.select { |article| article.fetch("title")&.downcase&.include?(query&.downcase) } if query.present?
    ActionCable.server.broadcast("SearchLogsChannel", turbo_stream: turbo_stream.replace("remote_articles", partial: "articles/articles", locals: { articles: filtered_articles }))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
