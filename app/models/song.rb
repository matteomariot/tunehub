class Song < ApplicationRecord
  belongs_to :band
  has_many :partitions, dependent: :destroy

  validates :name, length: { minimum: 2, too_short: "Song name should contain atleast 2 characters" }
  validates :name, presence: { message: "Song name is required" }
  validates :name, uniqueness: { message: "This name is already taken" }

  validates :description,
  length: {
    minimum: 15,
    maximum: 250,
    too_short: "The description must have at least 15 characters.",
    too_long: "The description must have no more than 150 characters."
  }
  validates :description, presence: { message: "Song description is required" }
end
