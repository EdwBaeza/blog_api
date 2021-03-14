# frozen_string_literal: true
module Users
  module Posts
    class Error < StandardError
      def initialize(message)
        super(message)
      end
    end
  end
end
