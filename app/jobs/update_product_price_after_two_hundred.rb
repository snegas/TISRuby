class UpdateProductPriceAfterTwoHundred
  @queue = :update_product_price_after_two_hunder

  def self.perform
    value_to_update = 0.1

    Product.where('price > ?', 200).where('price < ?', 205).find_each do |product|
      product.update_attribute :price => product.price + value_to_update
    end
  end
end