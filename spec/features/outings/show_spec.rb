require 'rails_helper'

RSpec.describe 'outing show page', type: :feature do
  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 1, hometown: 'ht_1', bachelorette: brette_1) }
  let!(:cont_2) { Contestant.create!(name: 'name_2', age: 2, hometown: 'ht_2', bachelorette: brette_1) }
  let!(:cont_3) { Contestant.create!(name: 'name_3', age: 3, hometown: 'ht_3', bachelorette: brette_1) }

  let!(:outing_1) { Outing.create!(name: 'out_1', location: 'loc_1', date: '01/01/21', contestants: [cont_1, cont_2, cont_3]) }

  before(:each) { visit outing_path(outing_1) }

  describe 'view elements' do
    it 'displays the outing name' do
      expect(page).to have_content(outing_1.name)
    end
    
    it 'desplays the outing info' do
      expect(page).to have_content(outing_1.location)
      expect(page).to have_content(outing_1.date)
    end

    it 'displays the count of the contestants' do
      expect(page).to have_content("Count of Contestants: 3")
    end

    it 'displays a list of the contestants' do
      expect(page).to have_content(cont_1.name)
      expect(page).to have_content(cont_2.name)
      expect(page).to have_content(cont_3.name)
    end
  end
end