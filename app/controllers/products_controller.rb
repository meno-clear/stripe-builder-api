class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order(:market_place_partner_id)
      if params[:category_id]
        @products = Product.where(category_id: params[:category_id])
      end
    @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.market_place_partner_id = current_user.market_place_partner.id

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:category_id, :name, { product_descriptor_values_attributes: [ :id, :product_descriptor_id, :value, :_destroy ]})
    end
end
