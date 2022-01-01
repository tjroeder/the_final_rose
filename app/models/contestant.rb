class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  validates_presence_of :name, :age, :hometown

  # Instance Methods
  def season_number
    bachelorette.season_number
  end

  def description
    bachelorette.description
  end
end
