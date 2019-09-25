class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true 
  validates :user_id, presence: true 

  def self.random_code 
    self.short_url = SecureRandom.urlsafe_base64 
    
  end
end