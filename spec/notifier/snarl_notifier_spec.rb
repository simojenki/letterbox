require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'notifier/notifier_shared'

module Notifier

  describe SnarlNotifier do
  
    before(:each) do
      @notifier = SnarlNotifier.new
    end
    
    it_should_behave_like "bubble notifier"
    
    it "should exec the snarl command" do
      Kernel.should_receive(:exec).with(
        "snarl_command /M \"message title\" \"message body\"")
      @notifier.publish(@email)
    end
    
  end
end

