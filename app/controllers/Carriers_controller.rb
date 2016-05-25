require 'CarriersWrapper'

class CarriersController

  def create
    @destination = (params["city"], params["state"], params["zip"])
    @destination_query = CarriersWrapper.fetch(@destination)
    # this gets sent to the wrapper

    render :new

  end







end
