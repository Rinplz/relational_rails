require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validates relationship' do
    it {should belong_to :book}
  end
end
