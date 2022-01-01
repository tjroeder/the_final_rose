require 'rails_helper'

RSpec.describe 'contestant show page' do
  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 1, hometown: 'ht_1', bachelorette: brette_1) }

  let!(:outing_1) { Outing.create!(name: 'out_1', location: 'loc_1', date: '01/01/21', contestants: [cont_1]) }
  let!(:outing_2) { Outing.create!(name: 'out_2', location: 'loc_2', date: '01/01/22', contestants: [cont_1]) }

  before(:each) { visit contestant_path(cont_1) }

  describe 'view elements' do
    it 'displays the contestant name' do
      expect(page).to have_content(cont_1.name)
    end

    it 'displays the contestants season and description' do
      expect(page).to have_content(cont_1.season_number)
      expect(page).to have_content(cont_1.description)
    end

    it 'displays the contestant outings' do
      expect(page).to have_content(outing_1.name)
      expect(page).to have_content(outing_2.name)
    end

    it 'displays the contestants name as clickable links' do
      expect(page).to have_link(outing_1.name, href: outing_path(outing_1))
      expect(page).to have_link(outing_2.name, href: outing_path(outing_2))
    end
  end

  describe 'clickable elements' do
    it 'redirects the user to the outing show page' do
      click_link(outing_1.name)
      
      expect(page).to have_current_path(outing_path(outing_1))
    end
  end
end