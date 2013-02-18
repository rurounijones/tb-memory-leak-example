class NodeStatusProcessor < TorqueBox::Messaging::MessageProcessor

  def on_message(message)
    status_record = DocumentQueueProcessor.where( :node_name => message[:node_name] ).first

    if status_record
      # For some reason this isn't triggering automatically so we will do it manually.
      status_record.updated_at = Time.zone.now
    else
      status_record = DocumentQueueProcessor.new
    end

    set_fields(status_record, message)
    status_record.save

  end

  def set_fields(status_record, message)
    status_record.node_name = message[:node_name]
    status_record.consumer_count = message[:consumer_count]
    status_record.scheduled_message_count = message[:scheduled_message_count]
  end

end
