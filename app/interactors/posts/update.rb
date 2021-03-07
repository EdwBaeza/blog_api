# frozen_string_literal: true

class Posts::Update
  include Interactor

  before do
    context.post = Post.find(context.id)
    context.attributes = context.options.to_h
  end

  def call
    strategy.new(context.post, context.attributes).update
  rescue Posts::Error => e
    handle_error(e.message)
  rescue StandardError => e
    handle_error(e.message, 500)
  end

  def strategy
    return Posts::Updaters::Default if context.attributes[:published].nil?
    return Posts::Updaters::Published if context.attributes[:published]

    Posts::Updaters::Unpublished
  end

  def handle_error(message, status = 400)
    return if context.failure?

    context.fail!(
      error: message,
      status: status
    )
   end
end
