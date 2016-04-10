require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "They see the names of all songs" do
    artist_one = create(:artist)
    artist_two = create(:artist)
    song_one   = create(:song, artist: artist_one)
    song_two   = create(:song, artist: artist_two)
    song_three = create(:song, artist: artist_one)

    visit songs_path

    # expect(page).to have_link song_one.title, href:song_path(song_one)
    # expect(page).to have_link song_two.title, href:song_path(song_two)
    # expect(page).to have_link song_three.title, href:song_path(song_three)
  end

end
