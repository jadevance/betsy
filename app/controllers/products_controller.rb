class ProductsController < ApplicationController

  def index
  @sellers = show_sellers
  @categories =  show_category
  @category = params[:category]
    if params[:category]
      by_category

    elsif params[:user_id]
      by_seller

    else
      @products = Product.where(status: false).order('LOWER (category)')
    end
    render :index
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.find_by(product_id: params[:id]) #returns nil if not found
    #@product has product dimensions
    render :show
  end

  def new
    @product = Product.new
    @user = User.find_by(id: session[:user_id])
    # @category = Product.find(1).category
  end

  def by_category
    @products = Product.where(status: false).where(category: params[:category])
  end

  def by_seller
    @user = User.find_by(id: params[:user_id])
    @products = @user.products.where(status: false)
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @product = @user.products.new(product_params[:product])

    if(@product.save)
      redirect_to user_products_path(@product.user_id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @user = User.find(params[:user_id])
    if session[:user_id] != @product.user_id
      flash[:nope] = "Nope - This is not your product!!!"
      redirect_to root_path
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params[:product])
    if @product.save
      redirect_to user_products_path(@product.user_id)
    else
      render 'edit'
    end
  end

  def show_category
    # @categories = Product.find_all[:category].uniq.downcase!
    @categories = Product.select('DISTINCT category').map(&:category)
  end

  def show_sellers
    @sellers = User.all.select { |user| user.products.count > 0 }
  end


  private

  def product_params
    params.permit(product: [:name, :description, :category, :status, :price, :photo_url, :stock, :user_id, :weight, :length, :height, :width])
  end

end
