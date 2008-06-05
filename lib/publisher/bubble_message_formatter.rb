
BubbleContent = Struct.new(:title, :body)

module Publisher
  class BubbleMessageFormatter
    def self.format email
      title = email[:subject]
      body = ''
      body << 'To: ' + email[:to] + "\n"
      body << 'From: ' + email[:from] + "\n"
      body << 'Message: ' + email[:body] + "\n"
      BubbleContent.new(title, body)
    end
  end
end
