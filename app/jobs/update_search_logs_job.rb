class UpdateSearchLogsJob < ApplicationJob
  queue_as :default

  def perform(args)
    ip_address = args.fetch(:ip_address)
    search_query = args.fetch(:search_query)

    SearchLog.create(ip_address: ip_address, search_query: search_query)
  end

end
