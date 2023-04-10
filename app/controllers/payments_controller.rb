class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show confirm ]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  def show
  end
  
  def confirm
    StripeService.confirm_payment(@payment)
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
