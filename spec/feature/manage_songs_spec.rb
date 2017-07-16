require 'rails_helper'

feature 'Manage songs', js: true do

  let(:artist) { create :artist }

  def fill_and_submit
    visit artist_path(artist.id)
    fill_in 'new-song-name', with: 'Random song for testing'
    fill_in 'new-song-year', with: '12345'
    page.execute_script("$('form').submit()")
  end

  scenario 'add a new song to artist' do
    fill_and_submit
    expect(page).to have_content('Random song for testing', '12345')

    # testing if it shows up after refreshing page
    visit artist_path(artist.id)
    expect(page).to have_content('Random song for testing', '12345')
  end

  # this does not work yet bc jquery songs do not create an id
  # scenario 'delete a song' do
  #   fill_and_submit
  #   click_link('song-id', '1')
  #   expect(page).not_to have_content('Random song for testing', '12345')
  # end

  scenario 'delete all songs' do
    fill_and_submit
    fill_and_submit
    click_link('delete-all')
    expect(page).not_to have_content('Random song for testing', '12345')
  end
end
