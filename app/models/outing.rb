class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  validates_presence_of :name, :location, :date

  # Instance Methods
  def contestant_count
    contestants.count
  end
end