require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "They see the page for the individual artist" do
    artist = Artist.create(name: "Bob Marely", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artists_path
    click_on "Bob Marely"

    expect(page).to have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")

    click_on "Delete"
    expect(page).to have_content "All Artists"
    expect(page).to_not have_content "Bob Marely"

  end
end
