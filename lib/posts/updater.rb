# frozen_string_literal: true

module Posts
  class Updater
    attr_reader :attributes, :post

    def initialize(post, attributes)
      @post = post
      @attributes = attributes
    end

    def update
      raise NotImplementedError
    end

    def valid_to_update?
      raise NotImplementedError
    end
  end
end
