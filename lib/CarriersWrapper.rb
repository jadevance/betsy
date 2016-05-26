require 'httparty'
require 'json'

class CarriersWrapper
  attr_reader :id, :ups, :usps
  
  BASE_URL = "http://super-sweet-shippers.herokuapp.com/get_rates/"

  def initialize(data)
    @ups_rates   = data["ups_rates"]
    @fedex_rates = data["usps_rates"]
  end

  def self.send_request(query)
    rates = HTTParty.post(BASE_URL + "#{query}").parsed_response
    self.new(rates)
  end
end
