class Album < ActiveRecord::Base
  validates :title, presence: true

  has_many :songs
  belongs_to :artist
end
