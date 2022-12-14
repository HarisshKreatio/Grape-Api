class Article < ApplicationRecord

  validates :title, presence: true, length: {minimum: 5, maximum: 10}
  validates :description, presence: true, length: {minimum: 5, maximum: 100}

  belongs_to :author

end
