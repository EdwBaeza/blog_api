# frozen_string_literal: true

module Posts
  module Updaters
    class Default < Posts::Updater

      def initialize(post, attributes)
        super(post, attributes)
      end

      def update
        post.update!(attributes)
      end
    end
  end
end
