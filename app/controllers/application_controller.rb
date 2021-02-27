# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from StandardError do |exception|
    render handle_error(exception.message)
  end

  protected

  def json_api(data, status, fields = {}, includes = "")
    json_api_params = JsonApi::Params.new(fields, includes)
    { 
      jsonapi: data,
      fields: json_api_params.to_fields,
      include: json_api_params.to_include,
      status: status
    }
  end

  def handle_error(errors, status = 500)
    {
      json: { errors: errors },
      status: status
    }
  end
end
