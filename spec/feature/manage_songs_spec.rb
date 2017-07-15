require 'rails_helper'

feature 'Manage songs', js: true do

  let(:artist) { create :artist }

  scenario 'add a new song to artist' do
    visit artist_path(artist.id)
    fill_in 'new-song-name', with: 'Random song for testing'
    fill_in 'new-song-year', with: '12345'
    page.execute_script("$('form').submit()")
    expect(page).to have_content('Random song for testing', '12345')
  end
end
