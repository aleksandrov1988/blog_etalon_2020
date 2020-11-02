class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post


  scope :ordering, -> { order(:created_at) }
end
