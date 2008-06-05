require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'publisher/publisher_shared'

module Publisher

  describe Growl do
  
    before(:each) do
      @notifier = Growl.new
    end
    
    it_should_behave_like "bubble notifier"
    
    it "should exec the growl command" do
      Kernel.should_receive(:exec).with(
        "echo -e \"message body\" | growlnotify --name letterbox --wait \"message title\"")
      @notifier.publish(@email)
    end
    
  end
end

