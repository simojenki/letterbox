require File.join(File.dirname(__FILE__), '..', 'spec_helper')

module Publisher

  shared_examples_for "bubble notifier" do
  
    before(:each) do
      @notification_content = stub('NotificationContent', 
          :title => 'message title', :body => 'message body')
      BubbleMessageFormatter.stub!(:format).and_return(@notification_content)
      Kernel.stub!(:exec).and_return("some output")
      STDOUT.stub!(:puts)
      @email = stub('email')
    end

    it "should ask BubbleMessageFormatter to format email " do
      BubbleMessageFormatter.should_receive(:format).with(@email).and_return(@notification_content)
      @notifier.publish(@email)
    end
    
    it "should log the output from the exec to STDOUT" do
      STDOUT.should_receive(:puts).with("some output")
      @notifier.publish(@email)
    end
    
    it "should be equal to another instance of the same notifier" do
      (@notifier == @notifier.class.new).should be_true
    end
  end
end

