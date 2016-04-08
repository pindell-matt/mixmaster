require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "They see the page for all artists" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content "All Artists"

    click_on "All Artists"
    
    expect(page).to have_content "All Artists"
    expect(page).to have_content "Bob Marley"
  end


end
