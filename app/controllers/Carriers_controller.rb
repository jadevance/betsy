require 'CarriersWrapper'

class CarriersController

  def create
    @city = params[:order][:city]
    @state = params[:order][:state]
    @zip = params[:order][:zip]

    @destination = (@city, @state, @zip)
    @destination_query = CarriersWrapper.fetch(@destination)
    # this gets sent to the wrapper

    render :new

  end


  def order_items
    #need to go through the whole order and find the weight of each object....
    #create a hash of each item
    #order item info array of hashes...

  end





end
