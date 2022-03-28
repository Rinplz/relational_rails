require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validates attributes' do
    it {should validate_presence_of :id}
    it {should validate_presence_of :title}
    it {should validate_presence_of :created_at}
    it {should validate_presence_of :updated_at}
    it {should validate_presence_of :book_completed?}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :author}
    it {should have_many :recipe}
  end
end
