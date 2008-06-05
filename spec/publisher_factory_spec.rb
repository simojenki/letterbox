require File.join(File.dirname(__FILE__), 'spec_helper')


describe PublisherFactory do
    
  it "should return growl publisher for mac" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('darwin9.0')
    @factory = PublisherFactory.new
    @factory.publishers.should include(Notifier::GrowlNotifier.new)
  end
    
  it "should return snarl publisher for windows" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('mswin32')
    @factory = PublisherFactory.new
    @factory.publishers.should include(Notifier::SnarlNotifier.new)
  end
    
  it "should return snarl publisher for cygwin" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('cygwin')
    @factory = PublisherFactory.new
    @factory.publishers.should include(Notifier::SnarlNotifier.new)
  end
    
  it "should return mumbles publisher for linux" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('linux')
    @factory = PublisherFactory.new
    @factory.publishers.should include(Notifier::MumblesNotifier.new)
  end
    
end

