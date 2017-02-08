require 'rails_helper'

describe 'user views an artist page' do
  describe "and they click on 'view all songs'" do
    it 'they see an alphabetical sort of all songs for the artist' do
      artist = create(:artist)
      song1 = create(:song, artist: artist)
      song2 = create(:song, artist: artist)

      visit artist_path(artist)

      click_on("View Songs")

      expect(page).to have_content(artist.name)
      expect(page).to have_link(song1.title, href: song_path(song1))
      expect(page).to have_link(song2.title, href: song_path(song2))
    end
  end
end
