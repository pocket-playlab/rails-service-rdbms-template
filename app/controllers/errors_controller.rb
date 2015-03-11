class ErrorsController < ApplicationController
  def bad_request
    render json: { error: 'BadRequest' }, status: :bad_request
  end

  def not_found
    render json: { error: 'NotFound' }, status: :not_found
  end

  def unprocessible_entity
    render json: { error: 'UnprocessibleEntity' }, status: :unprocessible_entity
  end

  def internal_server_error
    render json: { error: 'InternalServerError' }, status: :internal_server_error
  end
end
