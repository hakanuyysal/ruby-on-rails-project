module Api
    class CategoriesController < ApplicationController
  
      def index
        @categories = Category.order(id: :desc)
        if !@categories.blank?
          render json: @categories, status: :ok
        else
          render json: { error: "No categories found" }, status: :not_found
        end
      end
  
      def show
        category = set_category
        if !category.blank?
          render json: category, status: :ok
        else
          render json: { error: "Category not found" }, status: :not_found
        end
      end
  
      def update
        category = set_category
        if category.update(category_params)
          render json: category, status: :ok
        else
          render json: { error: "Category not updated" }, status: :unprocessable_entity
        end
      end
  
      def create
        category = Category.new(category_params)
        if category.save
          render json: category, status: :created
        else
          render json: { error: "Category not created" }, status: :unprocessable_entity
        end
      end
  
      def destroy
        category = set_category
        if category.destroy
          render json: category, status: :ok
        else
          render json: { error: "Category not deleted" }, status: :unprocessable_entity
        end
      end
      
  
      private
  
      def set_category
        @category = Category.find(params[:id])
      end
  
      def category_params
        params.require(:category).permit(:name, :slug)
      end
  
    end
  end
  