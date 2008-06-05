module Publisher
  class Growl
      
    include EqualOnType
      
    def publish email
      content = BubbleMessageFormatter.format(email)
      out = Kernel.exec("echo -e \"#{content.body}\" | growlnotify --name letterbox --wait \"#{content.title}\"")
      STDOUT.puts(out)
    end
  end
end
