class InstructorsController < ApplicationController
  def index
    instructors = Instructor.all
    render json: instructors, status: :ok
  end

  def show
    find_instructor
    render json: @instructor, status: :ok
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def update
    find_instructor
    @instructor.update!(instructor_params)
    render json: @instructor, status: :ok
  end

  def destroy
    find_instructor
    @instructor.destroy!
  end

  private
  def find_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.permit(:name)
  end
end
