class Band < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_one_attached :photo

  validates :name, length: { minimum: 2, message: "Band name should contain atleast 2 characters" }
  validates :name, presence: { message: "Band name is required" }
  validates :name, uniqueness: { scope: :user, message: "This name is already taken" }
end
