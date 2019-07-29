# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Students.destroy_all
Courses.destroy_all
StudentCourses.destroy_all

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
