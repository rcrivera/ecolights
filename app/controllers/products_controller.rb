class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products/1
  # GET /products/1.json
  def show
    if(params[:category_id].nil?)
      @category = @product.categories.first
    else
      @category = Category.find(params[:category_id])
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
