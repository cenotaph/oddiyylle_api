class Entry < ApplicationRecord
  has_one_attached :yword
  has_one_attached :ysound
  has_one_attached :homestory

  validates :cookie, presence: true, uniqueness: true
  
end
