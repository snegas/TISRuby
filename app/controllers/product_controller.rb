class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show(id)
    @product = Product.find id.to_i
  end

  def new
    @product = Product.new
  end

  def create(name, description, price)
    @product = Product.new name:name, description: description, price: price

    if @product.valid?
      if @product.save
        redirect_to :action => 'show', :id => @product.id
      else
        render :action => 'new'
      end
    end
  end

  def destroy(id)
    @product = Product.find id.to_i

    @product.destroy
  end

  def edit(id)
    @product = Product.find id.to_i
  end
end