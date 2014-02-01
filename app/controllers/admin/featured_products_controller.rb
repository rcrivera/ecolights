class Admin::FeaturedProductsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_featured_product, only: [:show, :edit, :update, :destroy]

  # GET /featured_products
  # GET /featured_products.json
  def index
    @featured_products = FeaturedProduct.all
    @header = 'Featured Products'
  end

  # GET /featured_products/1
  # GET /featured_products/1.json
  def show
  end

  # GET /featured_products/new
  def new
    @featured_product = FeaturedProduct.new
    @product = Product.find(params[:product_id])
    @header = "New Featured Product"
  end

  # GET /featured_products/1/edit
  def edit
    @product = @featured_product.product
    @header = "Edit Featured Product"
  end

  # POST /featured_products
  # POST /featured_products.json
  def create
    @featured_product = FeaturedProduct.new(featured_product_params)
    respond_to do |format|
      if @featured_product.save
        format.html { render action: 'index' }
        format.json { render action: 'show', status: :created, location: @featured_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @featured_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /featured_products/1
  # PATCH/PUT /featured_products/1.json
  def update
    respond_to do |format|
      if @featured_product.update(featured_product_params)
        format.html { redirect_to action: "index"}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @featured_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_products/1
  # DELETE /featured_products/1.json
  def destroy
    @featured_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_featured_products_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_product
      @featured_product = FeaturedProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featured_product_params
      params.require(:featured_product).permit(:product_id, :message, :position)
    end
end
