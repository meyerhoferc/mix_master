require 'rails_helper'

feature 'user edits an artist' do
  scenario 'they enter data to edit an artist' do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)
    click_on('Edit')
    fill_in("artist_name", with: "Courtney Meyerhofer")
    click_on("Update Artist")

    expect(current_path).to eq(artist_path(artist))
    expect(page).to have_content("Courtney Meyerhofer")
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
