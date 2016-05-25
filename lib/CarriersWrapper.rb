require 'httparty'

class CarriersWrapper
  #BASE_URL will be the Heroku https
  attr_reader :id, :ups, :fedex

  def initialize(rates)

    @id = rates["id"] #<-- this probably isnt necessary
    @ups_rates = rates["ups_rates"] #<-- this will be called what we call it in our API for the hash of the info get back back from each api, same below..
    @fedex_rates = rates["fedex_rates"]


  end


  def self.fetch(destination_query)
    #rates = HTTParty.post(BASE_URL + blah blah #{destination_query}).parsed_response <-- is this a post? to the api?

    #How is the info coming back? Do we need to set variables here to reach into the response we recieve for an inner hash?

    self.new(rates)
    #this will go get the instance variables and then back to the controller where this method was called, then render a view for new...this will show them the form to choose their rates
  end














end
