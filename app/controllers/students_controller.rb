class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students, status: :ok
  end

  def show
    find_student
    render json: @student, status: :ok
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def update
    find_student
    @student.update!(student_params)
    render json: @student, status: :ok
  end

  def destroy
    find_student
    @student.destroy
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end
end
