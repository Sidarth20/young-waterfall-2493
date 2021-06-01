require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:movie_actors)}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :name}
  end

  describe 'class method' do
    it 'tests for uniqueness' do
      actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
      actor_2 = Actor.create!(name: 'Robin Williams', age: 63, currently_working: false)
      actor_3 = Actor.create!(name: 'Irene Bedard', age: 53, currently_working: true)

      expect(Actor.actor_list).to eq([actor_1, actor_3])
    end
  end
end
