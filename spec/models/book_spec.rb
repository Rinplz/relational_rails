require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validates relationship' do
    it {should have_many :recipe}

  end
end
