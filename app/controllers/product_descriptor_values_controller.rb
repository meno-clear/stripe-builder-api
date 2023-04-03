class ProductDescriptorValuesController < ApplicationController
  before_action :set_product_descriptor_value, only: %i[ show update destroy ]

  # GET /product_descriptor_values
  # GET /product_descriptor_values.json
  def index
    @product_descriptor_values = ProductDescriptorValue.all
  end

  # GET /product_descriptor_values/1
  # GET /product_descriptor_values/1.json
  def show
  end

  # POST /product_descriptor_values
  # POST /product_descriptor_values.json
  def create
    @product_descriptor_value = ProductDescriptorValue.new(product_descriptor_value_params)

    if @product_descriptor_value.save
      render :show, status: :created, location: @product_descriptor_value
    else
      render json: @product_descriptor_value.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_descriptor_values/1
  # PATCH/PUT /product_descriptor_values/1.json
  def update
    if @product_descriptor_value.update(product_descriptor_value_params)
      render :show, status: :ok, location: @product_descriptor_value
    else
      render json: @product_descriptor_value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_descriptor_values/1
  # DELETE /product_descriptor_values/1.json
  def destroy
    @product_descriptor_value.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_descriptor_value
      @product_descriptor_value = ProductDescriptorValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_descriptor_value_params
      params.require(:product_descriptor_value).permit(:value, :integer_value, :boolean_value, :large_value, :product_id, :product_descriptor_id)
    end
end
