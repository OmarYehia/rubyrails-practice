class User < ApplicationRecord
  has_secure_password
  has_many :articles
  include ActiveModel::SerializerSupport
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
