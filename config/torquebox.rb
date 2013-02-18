TorqueBox.configure do
  ruby do
    version "1.9"
  end

  queue '/queues/node-reporting' do
    processor NodeStatusProcessor
  end

  service StatusReporter

  options_for Backgroundable, :concurrency => 0, :durable => false

end

