# frozen_string_literal: true

module Users
  module Posts
    module Status
      module Strategies
        class Default < Base
  
          def initialize(post, attributes)
            super(post, attributes)
          end
    
          def build_attributes
            attributes
          end

          def valid?
            true
          end

          def raise_error
            raise ::Users::Posts::Error.new("Unknow error")
          end
        end
      end
    end
  end
end
