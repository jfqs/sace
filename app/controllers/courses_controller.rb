class CoursesController < ApplicationController
  def index
    authorize Course
  end

end
