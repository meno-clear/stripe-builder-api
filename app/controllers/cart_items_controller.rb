class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show update destroy ]

  # GET /cart_items
  # GET /cart_items.json
  def index
    if params[:cart_id].present?
      @cart_items = CartItem.where(cart_id: params[:cart_id])
    else
      @cart_items = CartItem.all
    end
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      render :show, status: :created, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    if @cart_item.update(cart_item_params)
      render :show, status: :ok, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:product_name, :product_price_in_cents, :quantity, :cart_id, :product_id, :variant_id)
    end
end
