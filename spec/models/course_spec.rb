require 'rails_helper'

  describe Course, type: :model do
    describe 'Validations' do
      it {should validate_presence_of :name}
    end

  describe 'Relationships' do
    it {should have_many :student_courses}
      it {should have_many(:students).through(:student_courses)}
  end

  describe 'as a user' do
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
    end

    describe '.ordered_by_highest_grade' do
      it 'will order students from highest to lowest grade' do
        expect(@course_3.ordered_by_highest_grade.length).to eq(3)
      end
    end
  end
end
