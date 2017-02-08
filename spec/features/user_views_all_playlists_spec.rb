require 'rails_helper'

feature 'user vists playlists index' do
  it 'sees all playlists with corresponding links' do
    playlist_1, playlist_2, playlist_3 = create_list(:playlist_with_songs, 3)

    visit playlists_path

    expect(page).to have_link(playlist_1.name, href: playlist_path(playlist_1))
    expect(page).to have_link(playlist_2.name, href: playlist_path(playlist_2))
    expect(page).to have_link(playlist_3.name, href: playlist_path(playlist_3))
  end
end
