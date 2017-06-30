class ProductsController < ApplicationController

  def index
    @products = Product.recent_10
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.recent_10
  end

  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product saved!"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to  product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.reviews.each do |review|
      review.destroy
    end

    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country)
  end

end
