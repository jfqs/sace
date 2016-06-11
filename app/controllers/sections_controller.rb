class SectionsController < ApplicationController
  def search
    authorize Section
    @degree = EducationDegree.find(params[:degree_id])
    @sections = @degree.sections
  end
end
