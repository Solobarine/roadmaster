class Customer < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }
  validates :phone, presence: true, on: :account_update
  validates :address, presence: true, on: :account_update
  validates :city, presence: true, on: :account_update
  validates :state, presence: true, on: :account_update
  validates :zip_code, presence: true, length: { is: 6 }, on: :account_update
end
