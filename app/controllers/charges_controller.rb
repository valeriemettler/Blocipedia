class ChargesController < ApplicationController
  def new
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: 'Premium Membership',
        amount: 1_299
      }
  end

  def create
      @amount = params[:amount]
      customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

      charge = Stripe::Charge.create(
      customer: customer.id, 
      amount: @amount,
      description: 'Premium Membership',
      currency: 'usd'
    )
 
      current_user.update_attribute(:premium, true)

      redirect_to wikis_path, flash: { notice: "Congratulations, #{current_user.email}, on becoming a premium member!"}

  rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
  end
end
