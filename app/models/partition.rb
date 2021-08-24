class Partition < ApplicationRecord
  belongs_to :song
  belongs_to :member
  has_many :comments
end
