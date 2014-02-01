class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show]

  # GET /technologies
  # GET /technologies.json
  def index
    @technologies = Technology.all
    @header = "Technologies" 
  end

  # GET /technologies/1
  # GET /technologies/1.json
  def show
    @header = @technology.title
    @products = @technology.products
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end
end
