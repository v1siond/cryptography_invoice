class ProductsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @products = Product.all
    respond_to do |format|
      format.html {render :layout=> false}
      format.json { @product = Product.search(params[:term]) }
    end
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @products = Product.all
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.js { render json: [@products.last], status: :created }
      else
        flash[:quote_errors] = @product.errors.full_messages
        format.js { render new_product_path, status: :unprocessable_entity }
      end
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :price)
    end
end