class Response < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :content,
    length: {
      minimum: 1,
      maximum: 150,
      too_short: "The comment must have at least 1 characters.",
      too_long: "The comment must have no more than 150 characters."
    }
end
