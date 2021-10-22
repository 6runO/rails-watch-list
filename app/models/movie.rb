class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, uniqueness: { case_sensitive: false }, presence: true
  validates :overview, presence: true
end
