class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.new(dog_params)
    dog.dog_owner = current_user
    if dog.save
      redirect_to dog_path(dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    dog.update(dog_params)
    redirect_to dog_path(dog)
  end

  def destroy
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
