# frozen_string_literal: true

module Posts
  class Error < StandardError
    def initialize(message)
      super(message)
    end
  end
end
