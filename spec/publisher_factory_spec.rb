require File.join(File.dirname(__FILE__), 'spec_helper')


describe PublisherFactory do
    
  it "should return growl publisher for mac" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('darwin9.0')
    PublisherFactory.create_publishers.should include(Publisher::Growl.new)
  end
    
  it "should return snarl publisher for windows" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('mswin32')
    PublisherFactory.create_publishers.should include(Publisher::Snarl.new)
  end
    
  it "should return snarl publisher for cygwin" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('cygwin')
    PublisherFactory.create_publishers.should include(Publisher::Snarl.new)
  end
    
  it "should return mumbles publisher for linux" do
    Config::CONFIG.should_receive(:[]).with('target_os').and_return('linux')
    PublisherFactory.create_publishers.should include(Publisher::Mumbles.new)
  end
    
end

