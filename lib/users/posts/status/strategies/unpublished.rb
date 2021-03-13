# frozen_string_literal: true

module Users
  module Posts
    module Status
      module Strategies
        class Unpublished < Base
    
          def initialize(post, attributes)
            super(post, attributes)
          end
    
          def build_attributes
            attributes.merge(unpublished_at: Time.current)
          end
    
          def valid?
            post.published && post.user.is_premium
          end

          def raise_error
            raise ::Users::Posts::Error.new("Can't unpublish post must be published and user is_premium")
          end
        end
      end
    end
  end
end
