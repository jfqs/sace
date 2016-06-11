class EducationDegreesController < ApplicationController
  def search
    authorize EducationDegree
    @education_level = EducationLevel.find(params[:payment][:level])
    @education_degrees = @education_level.education_degrees
  end
end
