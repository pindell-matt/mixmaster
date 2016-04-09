require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "They see the names of all playlists" do
    playlists = %w(Jams Summer Radical).map do |playlist_name|
      Playlist.create(name: playlist_name)
    end

    visit playlists_path

    expect(page).to have_content "All Playlists"
    expect(page).to have_content "Jams"
    expect(page).to have_content "Summer"
    expect(page).to have_content "Radical"
  end

end
