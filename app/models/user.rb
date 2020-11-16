class User < ApplicationRecord
  has_secure_password

  has_many :posts, -> { ordering }, dependent: :destroy
  has_many :comments, -> { ordering }, dependent: :destroy

  scope :ordering, -> { order(:name) }


  validates :name, presence: true, length: {in: 2...100}
  validates :login, presence: true, length: {in: 2..100}, uniqueness: {case_sensetive: false}

  def edit_by?(current_user)
    current_user && (current_user == self || current_user.admin?)
  end
end
