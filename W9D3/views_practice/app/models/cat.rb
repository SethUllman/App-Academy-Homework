require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: %w(orange black white rainbow) }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F)}
  validates :description, presence: true

  def age
    
    time_ago_in_words(self.birth_date)
  end
end