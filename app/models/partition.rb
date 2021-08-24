class Partition < ApplicationRecord
  belongs_to :project
  belongs_to :member
  has_many :comments
end
