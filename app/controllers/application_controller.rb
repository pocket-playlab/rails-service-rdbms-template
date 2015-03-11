class ApplicationController < ActionController::Base
  def self.error_handler(status)
    lambda do |error|
      body = { error: error.class.name.demodulize }
      body.merge! error.extra if error.respond_to? :extra
      render json: body, status: status
    end
  end

  rescue_from StandardError, with: error_handler(:internal_server_error)
end
