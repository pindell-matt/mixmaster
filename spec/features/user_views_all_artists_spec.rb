require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "They see the names of all artists" do
    artists = %w(Bob Adele Beyonce).map do |artist_name|
      Artist.create(name: artist_name, image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    end

    visit artists_path

    expect(page).to have_content "All Artists"
    expect(page).to have_content "Bob"
    expect(page).to have_content "Adele"
    expect(page).to have_content "Beyonce"
  end

end
