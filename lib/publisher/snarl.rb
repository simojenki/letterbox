module Publisher
  class Snarl
      
    include EqualOnType
      
    def publish email
      content = BubbleMessageFormatter.format(email)
      out = Kernel.exec("snarl_command /M \"#{content.title}\" \"#{content.body}\"")
      STDOUT.puts(out)
    end
  end
end
