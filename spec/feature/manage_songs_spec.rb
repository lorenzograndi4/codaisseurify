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

    # testing if the new song shows up again after refreshing the page
    visit artist_path(artist.id)
    expect(page).to have_content('Random song for testing', '12345')
  end

  scenario 'delete a song' do
    fill_and_submit
    click_link('[New delete link]')
    expect(page).not_to have_content('Random song for testing', '12345')
  end

  scenario 'delete all songs' do
    fill_and_submit
    fill_and_submit
    click_link('delete-all')
    expect(page).not_to have_content('Random song for testing', '12345')
  end
end
