module Notifier
  module EqualOnType
    def == other
      self.class == other.class
    end
  end
end
