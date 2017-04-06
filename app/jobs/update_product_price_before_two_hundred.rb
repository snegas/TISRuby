class UpdateProductPriceBeforeTwoHundred
  @queue = :update_product_price_before_two_hunder

  def self.perform
    value_to_update = 1;

    Product.where('price < ?', 200).update_all('price=price+' + value_to_update.to_s)
  end
end