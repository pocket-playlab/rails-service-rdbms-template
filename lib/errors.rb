module Errors
  class Error < StandardError
    attr_reader :extra

    def initialize(extra = {})
      @extra = extra
    end
  end

  # Add custom errors here:
  # CustomError = Class.new Error
end
