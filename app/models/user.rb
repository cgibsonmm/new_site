class User < ApplicationRecord
  include ActiveModel::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_with UsernameValidator
  username_format = /\A[a-zA-Z]+[a-zA-z0-9]+\z/
  validates :username, format: {with: username_format}
  validates :username, presence: true, length: { in: (4..13) }
  validates :username, uniqueness: true
end
