require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validates attributes' do
    validates_presence_of :id
    validates_presence_of :title
    validates_presence_of :created_at
    validates_presence_of :updated_at
    validates_presence_of :book_completed?
    validates_presence_of :rating
    validates_presence_of :author
  end
end
