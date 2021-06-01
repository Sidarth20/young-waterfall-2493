class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  validates :name, presence: true, uniqueness: true

  def self.actor_list
    order(age: :desc).where('currently_working = ?', true)
  end
end
