module Rapa
  class Url
    TABLE_DOMAIN = {
      "br" => "http://webservices.amazon.com.br/onca/xml",
      "ca" => "http://webservices.amazon.ca/onca/xml",
      "cn" => "http://webservices.amazon.cn/onca/xml",
      "de" => "http://webservices.amazon.de/onca/xml",
      "es" => "http://webservices.amazon.es/onca/xml",
      "fr" => "http://webservices.amazon.fr/onca/xml",
      "in" => "http://webservices.amazon.in/onca/xml",
      "it" => "http://webservices.amazon.it/onca/xml",
      "jp" => "http://webservices.amazon.co.jp/onca/xml",
      "mx" => "http://webservices.amazon.com.mx/onca/xml",
      "uk" => "http://webservices.amazon.co.uk/onca/xml",
      "us" => "http://webservices.amazon.com/onca/xml",
    }

    # @param country_code [String]
    def initialize(country_code:)
      @country_code = country_code
    end

    # @override
    def to_s
      "http://webservices.amazon.#{domain}/onca/xml"
    end

    private

    # @private
    # @return [String]
    def country_code
      @country_code
    end

    # @private
    # @return [String]
    def domain
      TABLE_DOMAIN[country_code]
    end
  end
end
