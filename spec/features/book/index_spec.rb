require 'rails_helper'

RSpec.describe "book index page", type: :feature do
  it 'can see all books' do
    book_1 = Book.create(title: 'air fryer recipes', book_completed: false, rating: 5, author: 'allrecipe')
    book_2 = Book.create(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')

    visit "/books"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Rating: #{book_1.rating}/5")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Rating: #{book_2.rating}/5x`x`x``")
  end
end
