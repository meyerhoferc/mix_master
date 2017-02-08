require 'rails_helper'

feature 'user edits a playlist' do
  it 'by entering information into a form' do
    playlist = create(:playlist_with_songs)
    song_one, song_two, song_three = playlist.songs
    song_four = create(:song)
    visit playlist_path(playlist)
    click_on("Edit")

    fill_in("playlist_name", with: "Dis My New One")
    uncheck("song-#{song_one.id}")
    uncheck("song-#{song_two.id}")
    check("song-#{song_four.id}")
    click_on("Update Playlist")

    expect(page).to have_content("Dis My New One")

    within("li:last") do
      expect(page).to have_content(song_four.title)
    end
  end
end
