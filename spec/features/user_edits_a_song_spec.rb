
require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "They edit an artist's song" do
    artist        = Artist.create(name: "Bob Marely", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    song          = artist.songs.create(title: "Three Little Birds" )
    updated_title = "Redepmtion Song"

    visit artist_path(artist)

    click_on "Three Little Birds"
    click_on "Edit Title"

    fill_in "song_title", with: updated_title
    click_on "Update Song"

    expect(page).to have_content updated_title
    expect(page).to have_content artist.name
  end
end
