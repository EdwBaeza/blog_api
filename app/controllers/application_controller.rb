# frozen_string_literal: true

class ApplicationController < ActionController::API

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
end
