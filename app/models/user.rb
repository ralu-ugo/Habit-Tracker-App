class User < ApplicationRecord
  has_many :habits
  has_many :calendars
  has_many :habit_slots, through: :habit
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
