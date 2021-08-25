class Member < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_many :partitions, dependent: :destroy
  has_many :comments
end
