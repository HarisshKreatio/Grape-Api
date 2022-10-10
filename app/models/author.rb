class Author < ApplicationRecord

  before_save {self.email = email.downcase}
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: VALID_EMAIL_REGEX}

  has_many :articles

end
