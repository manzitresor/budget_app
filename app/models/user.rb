class User < ApplicationRecord
  has_many :entities, foreign_key: 'author_id'
  has_many :groups, foreign_key: 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
