module Notifier
  class GrowlNotifier
      
    include EqualOnType
      
    def publish email
      content = NotificationFormatter.format(email)
      out = Kernel.exec("echo -e \"#{content.body}\" | growlnotify --name letterbox --wait \"#{content.title}\"")
      STDOUT.puts(out)
    end
  end
end
