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
    def index
        @products = Product.all #değişkeni çoğul yap çünkü tüm ürünler göstermek için
        render json: @products
    end

    def index 
        @product = Product.find(params[:id])
        render json: @product
    end

    def index 
        @products = Product.order(created_at: :desc) #asc
        render json: @products
    end

    def show
        @product = Product.find(params[:id])
        render json: @product
    end

    # def index 
    #     @products = Product.where(name: "iPhone 15")
    #     render json: @products
    # end 

    # def index 
    #     @products = Product.where(name=?,  "iPhone 15")
    #     render json: @products
    # end 

    def product_params
        params.require(:product).permit(:name, :price, :description, :quantity)
     end 
 end
end
