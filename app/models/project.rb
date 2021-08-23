class Project < ApplicationRecord
  belongs_to :band
  has_many :partitions
end
