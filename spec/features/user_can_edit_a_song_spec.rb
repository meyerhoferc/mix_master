require 'rails_helper'

describe 'user edits a song' do
  scenario 'they see the updated song show page' do
    artist = create(:artist)
    song = create(:song, artist: artist)

    visit song_path(song)

    click_on("Edit")
    fill_in("song_title", with: "New Information")
    click_on("Update Song")

    expect(current_path).to eq(song_path(song))
    expect(page).to have_content("New Information")
  end
end
