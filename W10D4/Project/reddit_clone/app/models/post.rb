class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: {message: "must have at least one sub"}

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs,
    inverse_of: :post,
    dependent: :destroy

  has_many :subs,
    through: :post_subs,
    source: :sub
end
