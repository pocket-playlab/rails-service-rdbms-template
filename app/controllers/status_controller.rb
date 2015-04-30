class StatusController < ApplicationController
  before_action :run_checks

  def check
    render json: { errors: errors }, status: status
  end

  private

  def run_checks
    check_database
    check_redis
  end

  def check_database
    error :database, 'Not connected' unless ActiveRecord::Base.connected?
  end

  def check_redis
    error :redis, 'Not connected' unless REDIS.connected? || begin
                                                               REDIS.info
                                                             rescue SocketError
                                                               false
                                                             else
                                                               REDIS.connected?
                                                             end
  end

  def error(key, value)
    errors[key] = value
  end

  def errors
    @errors ||= {}
  end

  def status
    errors.empty? ? :ok : :service_unavailable
  end
end
