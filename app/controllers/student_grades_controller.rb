class StudentGradesController < ApplicationController
  def report_card
    authorize StudentGrade
    @students = current_user.students
    @bimesters = Period.where("year = 2016 and bimester is not null")
  end

  def course_grades
    authorize StudentGrade
    @teacher = current_user
    @curso = @teacher.programmed_sections.first
    @grade_types = GradeType.all
  end
end
