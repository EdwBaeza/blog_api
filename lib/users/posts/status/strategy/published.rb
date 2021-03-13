# frozen_string_literal: true

module Users
  module Posts
    module Status
      module Strategies
        class Published < Base
    
          def initialize(post, attributes)
            super(post, attributes)
          end
    
          def build_attributes
            attributes.merge(published_at: Time.current)
          end
    
          def valid?
            !post.published
          end

          def raise_error
            raise ::Users::Posts::Error.new("Can't publish post must be unpublished")
          end
        end
      end
    end
  end  
end
