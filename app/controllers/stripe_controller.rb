class StripeController < ApplicationController
  def plans
    plans = Stripe::Product.list({type: 'service'})[:data].sort_by { |plan| plan[:created] }
    render json: plans, status: :ok
  end
  
  def plan
    plan = Stripe::Plan.list({product: params[:id]})[:data].sort_by { |plan| plan[:created] }
    render json: plan, status: :ok
  end

  def new_subscription
    checkout = StripeService.create_new_payments_method(current_user)
    render json: checkout , status: :ok
  end 

  private
    def subscription_params
      params.require(:subscription).permit(:price)
    end
end
