require 'rails_helper'

RSpec.describe 'bachelorettes contestants index' do
  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 1, hometown: 'ht_1', bachelorette: brette_1) }
  let!(:cont_2) { Contestant.create!(name: 'name_2', age: 2, hometown: 'ht_2', bachelorette: brette_1) }
  
  before(:each) { visit bachelorette_contestants_path(brette_1) }
  describe 'view elements' do
    it 'displays bachelorettes contestants' do
      expect(page).to have_content(cont_1.name)
      expect(page).to have_content(cont_2.name)
    end

    it 'displays contestants info' do
      expect(page).to have_content(cont_1.age)
      expect(page).to have_content(cont_1.hometown)

      expect(page).to have_content(cont_2.age)
      expect(page).to have_content(cont_2.hometown)
    end

    it 'displays contestants name as a link to the contestants show page' do
      expect(page).to have_link(cont_1.name, href: contestant_path(cont_1))
      expect(page).to have_link(cont_2.name, href: contestant_path(cont_2))
    end
  end

  describe 'clickable elements' do
    it 'has contestants directs to their show page' do
      click_link(cont_1.name)
      
      expect(page).to have_current_path(contestant_path(cont_1))
    end
  end
end