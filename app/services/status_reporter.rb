class StatusReporter

  if defined?(TorqueBox)
    include TorqueBox::Injectors
  end

  def initialize(opts={})
    @reporting_thread = nil
    @reporting_queue = fetch_queue('/queues/node-reporting')
  end

  def start
    @reporting_thread = Thread.new { start_reporting }
  end

  def stop
    @done = true
    @reporting_thread.join(3)
  end

  private

  def start_reporting
    sleep 60
    puts "Start Reporting"
    until @done
      data = { :node_name => "test", :consumer_count => Random.rand(10), :scheduled_message_count => Random.rand(20)}
      @reporting_queue.publish(data, :persistent => false)

      sleep 0.1
    end
  end

end

