class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable
  enum role: [:guest, :member, :manager, :admin]

  has_many :notebooks
  has_many :notes, through: :notebooks
end
