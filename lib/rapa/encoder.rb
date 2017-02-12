require "cgi"

module Rapa
  class Encoder
    # @param parameters [Hash]
    # @return [String]
    def encode(parameters)
      parameters.map do |key, value|
        [
          key,
          ::CGI.escape(value),
        ].join("=")
      end.join("&")
    end
  end
end
