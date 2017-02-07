require 'rails_helper'

feature 'given that artists exists in the database' do
  scenario 'when a user visits the artists index' do
    queensryche_image_path = "https://duckduckgo.com/?q=queensryche&t=ffab&iax=1&ia=images&iai=https%3A%2F%2Fwww.visitrenotahoe.com%2Fimages%2Fcalendar%2F14_queensryche.jpg"
    parov_stelar_image_path = "https://duckduckgo.com/?q=parov+stelar&t=ffab&iax=1&ia=images&iai=http%3A%2F%2Felectroniccolorado.com%2Fwp-content%2Fuploads%2F2016%2F04%2Fparov-1024x591.jpg"
    weird_al_image_path = "https://duckduckgo.com/?q=weird+al&t=ffab&iar=images&iax=1&ia=images&iai=http%3A%2F%2Fthenypost.files.wordpress.com%2F2014%2F07%2Fgrammy_awards.jpg"
    Artist.create(name: "Queensryche", image_path: queensryche_image_path)
    Artist.create(name: "Parov Stelar", image_path: parov_stelar_image_path)
    Artist.create(name: "Weird Al", image_path: weird_al_image_path)

    visit artists_path

    ["Queensryche", "Parov Stelar", "Weird Al"].each do |name|
      expect(page).to have_content(name)
    end
    expect(page).to have_css("img[src=\"#{queensryche_image_path}\"]")
    expect(page).to have_css("img[src=\"#{parov_stelar_image_path}\"]")
    expect(page).to have_css("img[src=\"#{weird_al_image_path}\"]")

    click_link('Queensryche')
    expect(current_path).to eq(artist_path(Artist.find_by(name: "Queensryche")))
  end
end
