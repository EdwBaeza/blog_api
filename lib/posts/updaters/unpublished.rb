# frozen_string_literal: true

module Posts
  module Updaters
    class Unpublished < Posts::Updater

      def initialize(post, attributes)
        super(post, attributes)
      end

      def update
        raise Posts::Error.new("Can't unpublish post must be published") unless valid_to_update?
        post.update!(attributes.merge(unpublished_at: Time.current))
      end

      def valid_to_update?
        post.published && post.user.is_premium
      end
    end
  end
end
