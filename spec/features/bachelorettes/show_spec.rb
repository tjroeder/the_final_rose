require 'rails_helper'

RSpec.describe 'bachelorette show page', type: :feature do
  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 1, hometown: 'ht_1', bachelorette: brette_1) }
  let!(:cont_2) { Contestant.create!(name: 'name_2', age: 2, hometown: 'ht_2', bachelorette: brette_1) }
  let!(:cont_3) { Contestant.create!(name: 'name_2', age: 3, hometown: 'ht_3', bachelorette: brette_1) }

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

    it 'displays the average age of all contestants' do
      expect(page).to have_content("Average Age of Contestants: 2.0")
    end
  end

  describe 'clicking elements' do
    it 'will redirect to bachelorettes contestants' do
      click_link('Contestants')

      expect(page).to have_current_path(bachelorette_contestants_path(brette_1))
    end
  end
end