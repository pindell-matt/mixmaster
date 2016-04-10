require 'rails_helper'

RSpec.feature "User views all songs by artist" do
  scenario "they see all of the songs associated with an artist" do
    artist   = create(:artist)
    song_one = create(:song, artist: artist)
    song_two = create(:song, artist: artist)

    visit artists_path

    click_on artist.name

    click_on "View songs"

    expect(page).to have_content artist.name
    expect(page).to have_link song_one.title, href:song_path(song_one)
    expect(page).to have_link song_two.title, href:song_path(song_two)
  end
end
