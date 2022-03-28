require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validates attributes' do
    validates_presence_of :id
    validates_presence_of :name
    validates_presence_of :created_at
    validates_presence_of :updated_at
    validates_presence_of :has_been_made_once?
    validates_presence_of :ingredient_count
    validates_presence_of :ingredients

  end
end
