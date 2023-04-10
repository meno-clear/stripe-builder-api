class CartService

  def self.checkout(id, user, payment_method)
    cart = Cart.find(id)
    orders = []
    item_groups = cart.cart_items.group_by { |cart_item| cart_item.market_place_partner_id }.values
    customer = StripeService.get_customer(user)

    # Create Orders and OrderItems for each item group 
    item_groups.each do |item_group|
      order = Order.new
      order.user_id = user.id
      order.cart_id = id
      order.market_place_partner_id = item_group.first.market_place_partner_id

      if order.save
        orders << order
        item_group.each do |cart_item|
          order.order_items.create!(
            cart_item_id: cart_item.id,
            order_id: order.id,
            quantity: cart_item.quantity,
            price_in_cents: cart_item.product_price_in_cents,
          )
        end
      else 
        return { error: order.errors }
      end
    end
    # Create Payment and update orders created now
    payment = StripeService.create_payment(orders, customer, payment_method)

    return  payment
  end

    

  def self.handle_cart(cart_item_id, action_type, cart_item_params, cart_id)

    if cart_item_id.present? && action_type != 'create_item'
      cart_item = CartItem.find(cart_item_id)
    end

    case action_type
      when 'handle_quantity'
        cart_item.update(quantity: cart_item_params[:quantity])
      when 'create_item'
        cart_item = CartItem.new(cart_item_params)
        cart_item.market_place_partner_id = cart_item.product.market_place_partner.id
        cart_item.product_name = cart_item.product.name
        cart_item.cart_id = cart_id
        cart_item.save
      when 'remove_item'
        cart_item.destroy
    end
  end
end
