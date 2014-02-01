class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all 
    @header = "Products"
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @header = "New Product"
  end

  # GET /products/1/edit
  def edit
    @header = "Edit Product"
  end

  # POST /products
  # POST /products.json
  def create
    models = params[:product][:models_attributes]
    if !models.nil?
      models.each do |model|
        model[1][:characteristics] = sanitize_attributes(model[1][:characteristics])
      end
    end
    clean_params = product_params
    clean_params[:specifications] = sanitize_data(clean_params[:specifications])
    clean_params[:features] = sanitize_data(clean_params[:features])
    clean_params[:attributes_titles] = sanitize_attributes(clean_params[:attributes_titles])

    @product = Product.new(clean_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    models = params[:product][:models_attributes]
    if !models.nil?
      models.each do |model|
        model[1][:characteristics] = sanitize_attributes(model[1][:characteristics])
      end
    end

    clean_params = product_params
    clean_params[:specifications] = sanitize_data(clean_params[:specifications])
    clean_params[:features] = sanitize_data(clean_params[:features])
    clean_params[:attributes_titles] = sanitize_attributes(clean_params[:attributes_titles])

    @product.picture.destroy if params[:remove_picture] == '1'
    respond_to do |format|
      if @product.update(clean_params)
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :sku_code, :specifications, :features, :remove_picture, :picture,:attributes_titles, category_ids:[], technology_ids:[], approval_ids:[], :models_attributes => [:id, :sku_code,:characteristics,:_destroy], :downloads_attributes => [:id, :title, :pdf, :_destroy])
    end
end
