class User < ApplicationRecord
  has_secure_password

  has_many :urls

  validates :username, uniqueness: { case_sensitive: false }, format: {
    with: /\A[a-zA-Z]{5,15}\z/,
    message: "must contain letters and be between 5-15 characters"
  }
  validates :password, format: {
    with: /\A^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]{5,12}\z/,
    message: "must be alphanumerics and between 5-12 characters"
  }
  validates :email, uniqueness: true, format: {
    with: /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: "must be valid"
  }
end
