require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'notifier/notifier_shared'

module Notifier
  
  describe MumblesNotifier do
    
    before(:each) do
      @notifier = MumblesNotifier.new
    end

    it_should_behave_like "bubble notifier"
    
    it "should exec the mumbles command" do
      Kernel.should_receive(:exec).with(
        "echo -e \"message body\" | xargs -0 mumbles-send \"message title\"")
      @notifier.publish(@email)
    end
  end
end

