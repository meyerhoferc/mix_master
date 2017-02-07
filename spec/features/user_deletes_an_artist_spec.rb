require 'rails_helper'

feature 'user can delete an artist' do
  scenario 'when viewing the artist show' do
    queensryche_image_path = "https://duckduckgo.com/?q=queensryche&t=ffab&iax=1&ia=images&iai=https%3A%2F%2Fwww.visitrenotahoe.com%2Fimages%2Fcalendar%2F14_queensryche.jpg"
    artist = Artist.create(name: "Queensryche", image_path: queensryche_image_path)
    visit artist_path(artist)

    click_on 'Delete'

    expect(current_path).to eq(artists_path)
    expect(page).to_not have_content(artist.name)
  end
end
