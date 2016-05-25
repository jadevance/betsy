class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :seller?
  helper_method :username
  helper_method :current_order

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_order
    # user_id = session[:user_id] ||= nil

      if session[:order_id].nil? || Order.find_by(id: session[:order_id]).nil?
       order = Order.create(status: "pending")
       session[:order_id] = order.id
    #   @current_order = Order.find(session[:order_id])
    #   @current_order = Order.create(status: "pending") #user_id: user_id)
    #   session[:order_id] = @current_order.id
    end

    @current_order ||= Order.find_by(id: session[:order_id])

  end
  # @current_order
  def seller?
    current_user && current_user.type == "seller"
  end

  def username
    if current_user
      return current_user.username
    else
      return "Guest"
    end
  end
end

###
