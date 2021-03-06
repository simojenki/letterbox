module Publisher
  class Mumbles
      
    include EqualOnType
      
    def publish email
      content = BubbleMessageFormatter.format(email)
      out = Kernel.exec("echo -e \"#{content.body}\" | xargs -0 mumbles-send \"#{content.title}\"")
      STDOUT.puts(out)
    end
  end
end
