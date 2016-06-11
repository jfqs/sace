class PaymentsController < ApplicationController
  def index
    authorize Payment
    @guardian = Guardian.find(current_user.id)
  end

  def new_assign
    authorize Payment
    #@payment = Payment.new(params[:payment])
    @payment_types = PaymentType.others
    @levels = EducationLevel.all
    #params.require(:enrollment).permit(:student_id, :section_id)
  end

  def assign
    authorize Payment
    group = if params[:payment][:student_id].blank?
              Enrollment.where(section_id: Section.find(params[:payment][:section]),
                period_id: Period.current_period,
                state: 1)
            elsif params[:payment][:section].blank?
              Enrollment.where(state: 1,
                period_id: Period.current_period,
                section_id: EducationGrade.find(params[:payment][:degree]).section_ids)
            elsif params[:payment][:grade].blank?
              Enrollment.where(state: 1,
                period_id: Period.current_period,
                section_id: EducationLevel.find(params[:payment][:level]).education_degrees.includes(:sections).map(&:section_ids).flatten)
            else
              Enrollment.where(student_id: params[:payment][:student_id],
                period_id: Period.current_period,
                state: 1)
            end

    group.each do |student|
      Payment.create(student_id: student.student_id, payment_type_id: params[:payment_type_id])
    end

  end

  def edit
    authorize Payment
    @payment = Payment.find(params[:id])
  end

  def update
    authorize Payment
    @payment = Payment.find(params[:id])
    if @payment.update(pricing_params)

    else
      respond_to do |format|
        format.js
      end
    end
  end

  def pending
    authorize Payment
    #@guardian = Guardian.first
    @guardian = Guardian.find(current_user.id)
  end

  def pricing_params
    params.require(:payment).permit(:op_code, :op_date)
  end
end
