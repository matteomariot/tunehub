class Band < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :songs
end
