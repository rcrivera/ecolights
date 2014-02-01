class GeneralController < ApplicationController
  def index
  	@featured_products = FeaturedProduct.all.order(position: :asc)
  	@product = Product.first
  end

  def about_us
    @header= "About Us"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_product
      @featured_product = FeaturedProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:contact_name, :email, :phone, :contact_time, :message)
    end
end
