class EnrollmentsController < ApplicationController
  def index
    authorize Enrollment
    @student = Student.includes(:enrollments).where(:dni => params[:dni])
#    @enrollment = Enrollment.where(student_id: @student.id, period_id: Period.current_period)
  end

  def new
    authorize Enrollment
    @enrollment = Enrollment.new
    @student = Student.find(params[:student_id])
    a = []
    Section.includes(:education_degree => :education_level).each{|v| a <<[[v.education_degree.education_level.name, v.education_degree.name, v.name].join(", "), v.id]}
    @levels =  a
  end

  def create
    authorize Enrollment
    @enrollment = Enrollment.new(enrollment_params.merge({secretary_id: current_user.id, period_id: Period.current_period}))
    if @enrollment.save
      redirect_to enrollments_path(dni: @enrollment.student.dni)
    else
      render :new
    end
    #puts @enrollment.inspect
  end

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :section_id)
  end
end
