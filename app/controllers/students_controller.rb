class StudentsController < ApplicationController
  def index
    authorize Student
    @students = if params[:dni]
      Student.where(dni: params[:dni])
    else
      Student.all
    end
  end

  def search
    authorize Student
    @students = Enrollment.joins(:student).where(period_id: Period.current_period, section_id: params[:section_id], state: 1).map(&:student)
  end

  def new
    authorize Student
    @guardian = Guardian.new
    @students = @guardian.students.build
    #@student = Student.new
  end

  def create
    authorize Student
    @guardian = Guardian.new(guardian_params)
    if @guardian.save

      redirect_to students_path
    else
      puts @guardian.errors.inspect
      render :new
    end
  end

  def edit
    authorize Student
    @student = Student.find(params[:id])
  end

  def update
    authorize Student
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def show
    authorize Student
    @student = Student.find(params[:id])
  end

  def guardian_params
    params.require(:guardian).permit(:dni, :p_lastname, :m_lastname, :first_name, :email, :address, :phone, :address,students_attributes: [:dni, :p_lastname, :m_lastname, :first_name, :email, :address, :phone, :_destroy])
  end

  def student_params
    params.require(:student).permit(:dni, :p_lastname, :m_lastname, :first_name, :email, :address, :phone, :address)
  end
end
