class CreateSearchLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :search_logs do |t|
      t.string :ip_address
      t.string :search_query

      t.timestamps
    end
  end
end
