require 'httparty'
require 'json'

class CarriersWrapper
  attr_reader :id, :ups_rates, :usps_rates, :fedex_rates

  BASE_URL = "http://super-sweet-shippers.herokuapp.com/get_rates/"

  def initialize(response)
    #this is where i need to dig into the array of arrays of arrays? check out the shipping api
    @ups_rates   = response[0]
    @usps_rates = response[1]
    @fedex_rates = response[2]

    # @ups_rates   = [["ground", 19],["overnight", 50]]
    # @usps_rates = [["ground", 29],["overnight", 60]]
    # @fedex_rates = [["ground", 39],["overnight", 70]]
  end

  def self.send_request(rate_info)
    #if you're giving it a body, it has to be a post
    rates = HTTParty.post(BASE_URL, body: rate_info)
    if rates.code == 200 || rates.code == 299
      self.new(rates)
    else

    end
  end
end
