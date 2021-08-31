class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :members
  has_many :responses
  has_one_attached :photo

  validates :photo, presence: true

  def to_s
    nickname
  end
end
