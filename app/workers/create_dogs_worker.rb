class CreateDogsWorker
  include Sidekiq::Worker

  def perform
    access_token = ENV["PET_FINDER_TOKEN"] 
    petfinder = PetfinderService.new(access_token)
    
    page_number = 1 # Fetch the first page initially

    response = petfinder.get_dogs(page_number)

    if response.code == 200
      dogs_data = response.parsed_response['animals']
      create_dogs_from_data(dogs_data)
    else
      Rails.logger.error("Failed to fetch dogs: #{response.code} - #{response.parsed_response['detail']}")
    end
  end

  private

  def create_dogs_from_data(dogs_data)
    dogs_data.each do |dog_data|
      Dog.create(
        name: dog_data['name'],
        breed: dog_data['breeds']['primary'],
        # age: dog_data['age'],
        description: dog_data['description'],
        dog_owner: User.first
      )
    end
  end
end
