require 'rails_helper'

RSpec.describe 'Course Index Page'do
  describe 'as a user' do
    describe 'when I vist a course index page' do
      before(:each) do
        @student_1 = Student.create!(name: 'Student One')
        @student_2 = Student.create!(name: 'Student Two')
        @student_3 = Student.create!(name: 'Student Three')
        @student_4 = Student.create!(name: 'Student Four')

        @course_1 = Course.create!(name: "B.A.S.E.")
        @course_2 = Course.create!(name: "Auto Mechanics")
        @course_3 = Course.create!(name: "Wilderness Survival")
        @course_4 = Course.create!(name: "Dialectical Behavior Therapy")

        @student_1_course_1 = StudentCourse.create!(student: @student_1, course: @course_1, grade: 124.9)
        @student_1_course_2 = StudentCourse.create!(student: @student_1, course: @course_2, grade: 99.5)
        @student_1_course_3 = StudentCourse.create!(student: @student_1, course: @course_3, grade: 85.2)

        @student_2_course_1 = StudentCourse.create!(student: @student_2, course: @course_1, grade: 45.5)
        @student_2_course_2 = StudentCourse.create!(student: @student_2, course: @course_2, grade: 20.5)
        @student_2_course_3 = StudentCourse.create!(student: @student_2, course: @course_3, grade: 99.9)

        @student_3_course_2 = StudentCourse.create!(student: @student_3, course: @course_2, grade: 85.8)
        @student_3_course_3 = StudentCourse.create!(student: @student_3, course: @course_3, grade: 98.5)

        visit courses_path

      end

      it 'I see each course name and each student in the course orderd from highest to lowest grade' do

        within "#course-#{@course_1.id}" do

          expect(page).to have_content(@course_1.name)
          expect(page).to have_content(@student_1.name)
          expect(page).to have_content(@student_2.name)

        end

        within "#course-#{@course_2.id}" do

          expect(page).to have_content(@course_2.name)
          expect(page).to have_content(@student_1.name)
          expect(page).to have_content(@student_2.name)
          expect(page).to have_content(@student_3.name)

        end

        within "#course-#{@course_3.id}" do

          expect(page).to have_content(@course_3.name)
          expect(page).to have_content(@student_1.name)
          expect(page).to have_content(@student_2.name)
          expect(page).to have_content(@student_3.name)

        end

        within "#course-#{@course_4.id}" do

          expect(page).to have_content(@course_4.name)
        end
      end
    end
  end
end
