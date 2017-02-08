class Song < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true
  has_many :playlists, through: :playlist_songs
end
