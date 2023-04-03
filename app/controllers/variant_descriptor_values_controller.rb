class VariantDescriptorValuesController < ApplicationController
  before_action :set_variant_descriptor_value, only: %i[ show update destroy ]

  # GET /variant_descriptor_values
  # GET /variant_descriptor_values.json
  def index
    @variant_descriptor_values = VariantDescriptorValue.all
  end

  # GET /variant_descriptor_values/1
  # GET /variant_descriptor_values/1.json
  def show
  end

  # POST /variant_descriptor_values
  # POST /variant_descriptor_values.json
  def create
    @variant_descriptor_value = VariantDescriptorValue.new(variant_descriptor_value_params)

    if @variant_descriptor_value.save
      render :show, status: :created, location: @variant_descriptor_value
    else
      render json: @variant_descriptor_value.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /variant_descriptor_values/1
  # PATCH/PUT /variant_descriptor_values/1.json
  def update
    if @variant_descriptor_value.update(variant_descriptor_value_params)
      render :show, status: :ok, location: @variant_descriptor_value
    else
      render json: @variant_descriptor_value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /variant_descriptor_values/1
  # DELETE /variant_descriptor_values/1.json
  def destroy
    @variant_descriptor_value.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant_descriptor_value
      @variant_descriptor_value = VariantDescriptorValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_descriptor_value_params
      params.require(:variant_descriptor_value).permit(:value, :integer_value, :boolean_value, :large_value, :variant_descriptor_id, :variant_id, :product_id)
    end
end
