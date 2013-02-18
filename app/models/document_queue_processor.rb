class DocumentQueueProcessor < ActiveRecord::Base
  attr_accessible :document_queue_id, :node_name, :consumer_count, :scheduled_message_count
end
