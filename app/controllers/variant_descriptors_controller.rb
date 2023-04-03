class VariantDescriptorsController < ApplicationController
  before_action :set_variant_descriptor, only: %i[ show update destroy ]

  # GET /variant_descriptors
  # GET /variant_descriptors.json
  def index
    @variant_descriptors = VariantDescriptor.all
  end

  # GET /variant_descriptors/1
  # GET /variant_descriptors/1.json
  def show
  end

  # POST /variant_descriptors
  # POST /variant_descriptors.json
  def create
    @variant_descriptor = VariantDescriptor.new(variant_descriptor_params)

    if @variant_descriptor.save
      render :show, status: :created, location: @variant_descriptor
    else
      render json: @variant_descriptor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /variant_descriptors/1
  # PATCH/PUT /variant_descriptors/1.json
  def update
    if @variant_descriptor.update(variant_descriptor_params)
      render :show, status: :ok, location: @variant_descriptor
    else
      render json: @variant_descriptor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /variant_descriptors/1
  # DELETE /variant_descriptors/1.json
  def destroy
    @variant_descriptor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant_descriptor
      @variant_descriptor = VariantDescriptor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_descriptor_params
      params.require(:variant_descriptor).permit(:name, :available_options, :value_type)
    end
end
