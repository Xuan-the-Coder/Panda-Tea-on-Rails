class CheckoutController < ApplicationController
  def create
    @product = Product.find(params[:id])

    if @product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types:['card'],
      line_items: [
        {
          name: @product.name,
          description: @product.description,
          amount: (@product.price * 100).to_i,
          currency: 'cad',
          quantity: 1
        }
      ],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
