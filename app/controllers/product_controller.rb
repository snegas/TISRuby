class ProductController < ApplicationController
  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.json { render :json => @posts }
    end
  end

  def show
    @product = Product.find params[:id].to_i
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new :name => params[:name], :description => params[:description], :price => params[:price]

    if product.valid?
      if product.save
        redirect_to :action => 'show', :id => product.id
      else
        render :action => 'new'
      end
    end
  end

  def destroy
    product = Product.find params[:id].to_i
    product.destroy
  end

  def edit
    @product = Product.find params[:id].to_i
  end

  def update
    product = Product.find params[:id].to_i
    product.update!(params)
  end

  def increase_price
    Resque.enqueue(UpdateProductPriceBeforeTwoHundred)
    Resque.enqueue(UpdateProductPriceAfterTwoHundred)

    redirect_to :action => '/'
  end
end