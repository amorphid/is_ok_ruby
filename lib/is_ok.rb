require "is_ok/version"

module IsOK
  class Error < StandardError; end

  class IsResponse
    attr_reader :data

    def initialize(data)
      @data = data
    end
  end

  class IsOK < IsResponse ; end

  class IsError < IsResponse ; end

  class << self
    def ok(data)
      IsOK.new(data)
    end

    def error(data)
      IsError.new(data)
    end
  end
end
