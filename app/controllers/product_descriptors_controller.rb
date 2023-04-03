class ProductDescriptorsController < ApplicationController
  before_action :set_product_descriptor, only: %i[ show update destroy ]

  # GET /product_descriptors
  # GET /product_descriptors.json
  def index
    @product_descriptors = ProductDescriptor.all
  end

  # GET /product_descriptors/1
  # GET /product_descriptors/1.json
  def show
  end

  # POST /product_descriptors
  # POST /product_descriptors.json
  def create
    @product_descriptor = ProductDescriptor.new(product_descriptor_params)

    if @product_descriptor.save
      render :show, status: :created, location: @product_descriptor
    else
      render json: @product_descriptor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_descriptors/1
  # PATCH/PUT /product_descriptors/1.json
  def update
    if @product_descriptor.update(product_descriptor_params)
      render :show, status: :ok, location: @product_descriptor
    else
      render json: @product_descriptor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_descriptors/1
  # DELETE /product_descriptors/1.json
  def destroy
    @product_descriptor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_descriptor
      @product_descriptor = ProductDescriptor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_descriptor_params
      params.require(:product_descriptor).permit(:name, :available_options)
    end
end
