class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :phone, presence: true
  validates :position, presence: true
  validates :hire_date, presence: true
end
