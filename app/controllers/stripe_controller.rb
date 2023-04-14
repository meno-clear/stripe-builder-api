class StripeController < ApplicationController
  def plans
    plans = Stripe::Product.list({type: 'service'})[:data].sort_by { |plan| plan[:created] }
    render json: plans, status: :ok
  end
  
  def plan
    plan = Stripe::Plan.list({product: params[:id]})[:data].reverse()
    render json: plan, status: :ok
  end

  def payment_methods
    payment_methods = StripeService.get_payment_methods(current_user)
    render json: payment_methods, status: :ok
  end

  def new_payment_method
    payment_method = StripeService.attach_new_payments_method(current_user, payment_method_params[:id] )
    render json: {message: 'Payment method was created successfully'}, status: :ok
  end

  def new_subscription
    checkout = StripeService.create_new_subscription(
        current_user, 
        subscription_params[:price_id], 
        subscription_params[:payment_method_id]
    )
    render json: checkout , status: :ok
  end 

  private
    def subscription_params
      params.require(:subscription).permit(:price_id, :payment_method_id)
    end

    def payment_method_params
      params.require(:payment_method).permit(:id)
    end
end
