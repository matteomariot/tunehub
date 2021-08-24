class Member < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_many :partitions
  has_many :comments
end
