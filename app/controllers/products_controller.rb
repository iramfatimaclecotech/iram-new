class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def create
        @product = Product.new(product_params)
      
        if @product.save
         
        else
          render :new, status: :unprocessable_entity
        end
      end
      
    def update
        @product = Product.find(params[:id])
        
        if @product.update(product_params)
            redirect_to products_path
        else
            #...
        end
    end
end
