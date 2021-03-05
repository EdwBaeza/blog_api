# frozen_string_literal: true

module Posts
  module Updaters
    class Published < Posts::Updater

      def initialize(post, attributes)
        super(post, attributes)
      end

      def update
        raise Posts::Error.new("Can't publish post must be unpublished") unless valid_to_update?
        post.update!(attributes.merge(published_at: Time.current))
      end

      def valid_to_update?
        !post.published
      end
    end
  end
end
