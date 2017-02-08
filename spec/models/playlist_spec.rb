require 'rails_helper'

describe Playlist, "associations", type: :model do
  it { should have_many(:playlist_songs) }
  it {should have_many(:songs).through(:playlist_songs)}
end
