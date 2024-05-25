module Api
 class ProductsController < ApplicationController
    def create
        @product = Product.create(product_params)
        @product.save
        render json: @product 
    end

    def update 
        @product = Product.find(params[:id])
        @product.update(product_params)
        render json: @product
    end 

    def destroy 
        @product = Product.find(params[:id])
        @product.destroy
        render json: @product
    end

    def product_params
        params.require(:product).permit(:name, :price, :description, :quantity)
     end 
 end
end
