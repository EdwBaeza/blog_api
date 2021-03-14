# frozen_string_literal: true

class Users::Posts::Update
  include Interactor

  before do
    context.attributes = context.options.to_h
  end

  def call
    strategy = strategy_path.new(context.post, context.attributes)
    strategy.raise_error unless strategy.valid?
    context.post.update!(strategy.build_attributes)
  rescue ::Users::Posts::Error => e
    handle_error(e.message)
  rescue StandardError => e
    handle_error(e.message, 500)
  end

  def strategy_path
    return ::Users::Posts::Status::Strategies::Default if context.attributes[:published].nil?
    return ::Users::Posts::Status::Strategies::Published if context.attributes[:published]

    ::Users::Posts::Status::Strategies::Unpublished
  end

  def handle_error(message, status = 400)
    return if context.failure?

    context.fail!(
      error: message,
      status: status
    )
  end
end
