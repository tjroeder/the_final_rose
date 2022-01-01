require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it { should have_many :contestants }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :season_number }
    it { should validate_presence_of :description }
  end
  
  let!(:brette_1) { Bachelorette.create!(name: 'brette_1', season_number: 1, description: 'desc_1') }

  let!(:cont_1) { Contestant.create!(name: 'name_1', age: 2, hometown: 'ht_1', bachelorette: brette_1) }
  let!(:cont_2) { Contestant.create!(name: 'name_2', age: 2, hometown: 'ht_2', bachelorette: brette_1) }
  let!(:cont_3) { Contestant.create!(name: 'name_2', age: 3, hometown: 'ht_3', bachelorette: brette_1) }

  describe 'instance methods' do
    describe '#contestant_avg_age' do
      it 'should return the average age of the contestants' do
        expect(brette_1.contestant_avg_age).to eq(2.3)
      end
    end
  end
end
