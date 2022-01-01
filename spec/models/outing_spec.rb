require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :date }
  end

  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 1, hometown: 'ht_1', bachelorette: brette_1) }
  let!(:cont_2) { Contestant.create!(name: 'name_2', age: 2, hometown: 'ht_2', bachelorette: brette_1) }
  let!(:cont_3) { Contestant.create!(name: 'name_3', age: 3, hometown: 'ht_3', bachelorette: brette_1) }

  let!(:outing_1) { Outing.create!(name: 'out_1', location: 'loc_1', date: '01/01/21', contestants: [cont_1, cont_2, cont_3]) }

  describe 'instance methods' do
    describe '#contestant_count' do
      it 'returns the number of contestants for outing' do
        expect(outing_1.contestant_count).to eq(3)
      end
    end
  end
end