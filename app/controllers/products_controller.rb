class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id].to_i)
  end

  def new
    @product = Product.new
    3.times { @product.product_attachments.build }
  end

  def create
    product = Product.new(params[:product])

    if product.save
      flash[:success] = 'Product was created'
      redirect_to action: :show, id: product.id
    else
      flash[:error] = 'Product was not created due to validation failed.'
      redirect_to action: :new
    end
  end

  def search
    @products = Product.search(params[:search_query_string])
  end

  def edit
    @product = Product.find(params[:id].to_i)
    (3 - @product.product_attachments.count).times { @product.product_attachments.build }
  end

  def update
    product = Product.find(params[:product][:id].to_i)

    if product.update_attributes(params[:product])
      flash[:success] = 'Product was updated'
      redirect_to action: :show, id: product.id
    else
      flash[:error] = 'Product was not updated'
      redirect_to action: :edit, id: product.id
    end
  end

  def destroy
    if Product.destroy(params[:id])
      flash[:success] = 'Product was deleted successfully'
    else
      flash[:error] = 'Product was not deleted'
    end

    redirect_to action: :index
  end

  def increase_price
    Resque.enqueue(UpdateProductPriceBeforeTwoHundred)
    Resque.enqueue(UpdateProductPriceAfterTwoHundred)

    redirect_to action: :index
  end
end