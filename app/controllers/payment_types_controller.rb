class PaymentTypesController < ApplicationController
  def new
    authorize PaymentType
    @payment_type = PaymentType.new
    @payment_types = PaymentType.all
  end

  def create
    authorize PaymentType
    @payment_type = PaymentType.new(payment_type_params)
    if @payment_type.save
      redirect_to new_payment_type_path
    else
      render :new
    end
  end

  def payment_type_params
    params.require(:payment_type).permit(:name, :amount)
  end
end
