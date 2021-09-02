class Member < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_many :partitions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_uniqueness_of :user_id, :scope => [:band_id]

  def to_s
    User.find(user_id)
  end
end
