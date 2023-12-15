class DogsController < ApplicationController
  before_action :find_dog, only: %i[show edit update destroy]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.create(dog_params)
    redirect_to dog_path(dog)
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    dog = Dog.find(params[:id])
    dog.update(dog_params)
    redirect_to dog_path(dog)
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :description, :date_of_birth, :rescue, :breeder)
  end

  def find_dog
    @dog = Dog.find(params[:id])
  end
end