class SaveProduct
    @queue = "save_products"
  
    def self.perform(product_params)
        product = Product.new
        product.title = product_params["title"]
        product.product_type = product_params["type"]
        product.description = product_params["description"]
        product.filename = product_params["filename"]
        product.height = product_params["height"]
        product.width = product_params["width"]
        product.price = product_params["price"]
        product.rating = product_params["rating"]
        product.save
    end
end