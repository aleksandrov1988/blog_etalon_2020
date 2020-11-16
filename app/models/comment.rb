class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :ordering, -> { order(:created_at) }

  validates :body, presence: true, length: {minimum: 2 ,maximum: 200}

  def edit_by?(current_user)
    current_user == user || current_user&.admin?
  end
end
