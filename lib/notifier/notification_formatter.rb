
NotificationContent = Struct.new(:title, :body)

module Notifier
  class NotificationFormatter
    def self.format email
      title = email[:subject]
      body = ''
      body << 'To: ' + email[:to] + "\n"
      body << 'From: ' + email[:from] + "\n"
      body << 'Message: ' + email[:body] + "\n"
      NotificationContent.new(title, body)
    end
  end
end
