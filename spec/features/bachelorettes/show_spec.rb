require 'rails_helper'

RSpec.describe 'bachelorette show page', type: :feature do
  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  before(:each) { visit bachelorette_path(brette_1) }

  describe 'view elements' do
    it 'displays bachelorettes info' do
      expect(page).to have_content(brette_1.name)
      expect(page).to have_content("Season #{brette_1.season_number}")
      expect(page).to have_content(brette_1.description)
    end

    it 'displays a link to bachelorettes contestants' do
      expect(page).to have_link('Contestants', href: bachelorette_contestants_path(brette_1))
    end
  end

  describe 'clicking elements' do
    it 'will redirect to bachelorettes contestants' do
      click_link('Contestants')

      expect(page).to have_current_path(bachelorette_contestants_path(brette_1))
    end
  end
end