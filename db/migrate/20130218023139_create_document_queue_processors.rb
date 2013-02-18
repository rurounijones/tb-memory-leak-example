class CreateDocumentQueueProcessors < ActiveRecord::Migration
  def change
    create_table :document_queue_processors do |t|
      t.integer :document_queue_id
      t.string :node_name
      t.integer :consumer_count
      t.integer :scheduled_message_count
      t.timestamps
    end
  end
end

