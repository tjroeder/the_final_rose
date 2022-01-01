class Bachelorette < ApplicationRecord
  has_many :contestants

  validates_presence_of :name, :season_number, :description

  # Instance Methods
  def contestant_avg_age
    contestants.average(:age).round(1)
  end

  def hometown_list
    contestants.distinct.pluck(:hometown)
  end
end
