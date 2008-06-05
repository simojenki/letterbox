require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

module Letterbox::Notifier
  describe NotificationFormatter, 'formatting email' do
  
    before(:each) do
      @email = {}
      @email[:to] = 'to@someplace.com'
      @email[:from] = 'from@someone.com'
      @email[:subject] = 'meaningful subject'
      @email[:body] = 'this is the message'
      
      @formatted_email = NotificationFormatter.format(@email)
    end

    it "should have email subject field in notification title" do
      @formatted_email[:title].should eql(@email[:subject])
    end
    
    it 'should have to field in notification body' do
      @formatted_email[:body].should include('To: ' + @email[:to])
    end
    
    it 'should have from field in notification body' do
      @formatted_email[:body].should include('From: ' + @email[:from])
    end
    
    it 'should have body field in notification body' do
      @formatted_email[:body].should include('Message: ' + @email[:body])
    end
    
    it 'should support multiple to fields'
    
    it 'should support formatting the message'
  end
  
end

