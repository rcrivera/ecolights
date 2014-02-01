class Admin::ModelsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    clean_params = model_params
    Rails.logger.info clean_params[:characteristics]
    clean_params[:characteristics] = sanitize_attributes(clean_params[:characteristics])
    Rails.logger.info clean_params[:characteristics]
    @model = Model.new(clean_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to [:admin, @model], notice: 'Model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @model }
      else
        format.html { render action: 'new' }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    clean_params = model_params
    Rails.logger.info clean_params[:characteristics]
    clean_params[:characteristics] = sanitize_attributes(clean_params[:characteristics])
    Rails.logger.info clean_params[:characteristics]
    
    respond_to do |format|
      if @model.update(clean_params)
        format.html { redirect_to [:admin, @model], notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to admin_models_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:product_id, :sku_code, :characteristics)
    end
end
