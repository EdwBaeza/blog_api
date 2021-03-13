# frozen_string_literal: true

module Users
  module Posts
    module Status
      module Strategies
        class Base
          attr_reader :attributes, :post
      
          def initialize(post, attributes)
            @post = post
            @attributes = attributes
          end
      
          def build_attributes
            raise NotImplementedError
          end
      
          def valid?
            raise NotImplementedError
          end

          def raise_error
            raise NotImplementedError
          end
        end
      end
    end
  end
end
