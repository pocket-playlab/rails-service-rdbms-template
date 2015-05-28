class StatusController < ApplicationController
  before_action :run_checks

  class << self
    def commit
      @commit ||= begin
        head = File.read '.git/HEAD'
        ref = head.match(/^ref: (.+)/)[1]
        File.read(".git/#{ref}").strip
      rescue
        'unknown'
      end
    end
  end

  def check
    render json: { commit: self.class.commit, errors: errors }, status: status
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
