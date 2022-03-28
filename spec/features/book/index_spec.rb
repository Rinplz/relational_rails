require 'rails_helper'

RSpec.describe "book index page", type: :feature do
  it 'can see all books' do
    book_1 = Book.create(title: 'air fryer recipes', book_completed: false, rating: 5, author: 'allrecipe')
    book_2 = Book.create(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')

    visit "/books"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
  end

  it 'can show attributes when searched by id' do
    book_1 = Book.create(title: 'air fryer recipes', book_completed: false, rating: 5, author: 'allrecipe')
    book_2 = Book.create(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')

    visit "/books/#{book_1.id}"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Rating: #{book_1.rating}/5")
    expect(page).to have_content("Series: #{book_1.author}")
  end
end
