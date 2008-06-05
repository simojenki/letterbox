module Notifier
  class SnarlNotifier
      
    include EqualOnType
      
    def publish email
      content = NotificationFormatter.format(email)
      out = Kernel.exec("snarl_command /M \"#{content.title}\" \"#{content.body}\"")
      STDOUT.puts(out)
    end
  end
end
