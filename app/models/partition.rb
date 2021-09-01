class Partition < ApplicationRecord
  belongs_to :song
  belongs_to :member
  has_many :comments, dependent: :destroy
  has_one_attached :audio

  validates :title, length: { minimum: 2, too_short: "Partition title should contain atleast 2 characters" }
  validates :title, presence: { message: "Partition title is required" }
  validates :title, uniqueness: { scope: :song, message: "This title is already taken" }

  validates :instrument, length: { minimum: 2, too_short: "Instrument name should contain atleast 2 characters" }
  validates :instrument, presence: { message: "Instrument name is required" }
end
