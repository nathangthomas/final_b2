class StudentCourses < ApplicationController

  def show 
    @student_course = StudentCourse.find(params[:id])
  end
end
