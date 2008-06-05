require File.join(File.dirname(__FILE__), '..', 'spec_helper')

module Publisher

  describe PublisherAdapter, 'adapting a single publisher' do
    before(:each) do
      @publisher, @tmail = mock('publisher'), mock('tmail')
      @message = 'some email message'
      @publisher_adapter = PublisherAdapter.new(@publisher)
    end

    it "should have a single publisher" do
      @publisher_adapter.should have(1).publishers
    end
    
    it 'should publish the publisher with a TMail object when told to update' do
      TMail::Mail.should_receive(:parse).with(@message).and_return(@tmail)
      @publisher.should_receive(:publish).with(@tmail)
      @publisher_adapter.update(@message)
    end
  end

  describe PublisherAdapter, 'adapting 4 publishers' do
    before(:each) do
      @publishers = Array.new(4) {|i| mock("publisher_#{i}")}
      @tmail = mock('tmail')
      @message = 'some email message'
      @publisher_adapter = PublisherAdapter.new(*@publishers)
    end

    it "should have 4 publishers" do
      @publisher_adapter.should have(4).publishers
    end
    
    it 'should publish each publisher with the TMail object when told to update' do
      TMail::Mail.should_receive(:parse).with(@message).and_return(@tmail)
      @publishers.each {|publisher| publisher.should_receive(:publish).with(@tmail) }
      @publisher_adapter.update(@message)
    end
  end
  
end

