require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :hometown }
  end

  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 1, hometown: 'ht_1', bachelorette: brette_1) }

  describe 'instance methods' do
    describe '#season_number' do
      it 'should return the season number the contestant was a part of' do
        expect(cont_1.season_number).to eq(brette_1.season_number)
      end
    end

    describe '#description' do
      it 'should return the season description of the contestant season' do
        expect(cont_1.description).to eq(brette_1.description)
      end
    end
  end
end
