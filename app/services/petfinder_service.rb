class PetfinderService
  include HTTParty
  base_uri 'https://api.petfinder.com/v2'

  def initialize(access_token)
    @headers = {
      'Authorization' => "Bearer #{access_token}"
    }
  end

  def get_dogs(page)
    Rails.cache.fetch("dogs_page_#{page}", expires_in: 1.day) do
      self.class.get('/animals', query: { type: 'dog', page: page }, headers: @headers)
    end
  end
end