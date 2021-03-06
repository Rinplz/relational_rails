require 'rails_helper'

RSpec.describe "book pages", type: :feature do
  before :each do
    @book_1 = Book.create(title: 'air fryer recipes', book_completed: false, rating: 5, author: 'allrecipe')
    @book_2 = Book.create(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')
    @recipe_1 = Recipe.create!(name: 'cajun salmon',ingredient_count: 3, ingredient_list: 'salmon, cajun seasoning, butter', book_id: Book.first.id)
    @recipe_2 = Recipe.create!(name: 'nikujaga',ingredient_count: 4, ingredient_list: 'beef, potatoes, carrots, green beans', book_id: Book.first.id)
    @views = ["/books", "/books/#{@book_1.id}","/books/#{@book_1.id}/recipes"]

  end
  it 'can see all books' do

    visit "/books"

    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_2.title)
  end

  it 'can show attributes when searched by id' do
    visit "/books/#{@book_1.id}"

    expect(page).to have_content(@book_1.title)
    expect(page).to have_content("Rating: #{@book_1.rating}/5")
    expect(page).to have_content("Series: #{@book_1.author}")
    expect(page).to have_content("Recipes included: 2")
  end

  it 'can show all recipes in a book' do
    visit "/books/#{@book_1.id}/recipes"

    expect(page).to have_content(@recipe_1.name)
    expect(page).to have_content(@recipe_2.name)
    expect(page).to have_content("ingredients needed: #{@recipe_1.ingredient_count}| #{@recipe_1.ingredient_list}")
    expect(page).to have_content("ingredients needed: #{@recipe_2.ingredient_count}| #{@recipe_2.ingredient_list}")
  end

  it 'has a link to index on each page' do
    @views.each do |view|
      visit view

      expect(page).to have_link('Books Index')
      click_link('Books Index')

      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_2.title)
      expect(@book_1.title).to appear_before(@book_2.title)
    end
  end

  it 'has a link to a certain ids recipe index on the show page' do
    visit "/books/#{@book_1.id}"

    expect(page).to have_link('Recipes Included in This Book')
    click_link('Recipes Included in This Book')

    expect(page).to have_content(@recipe_1.name)
    expect(page).to have_content(@recipe_2.name)
    expect(page).to have_content("ingredients needed: #{@recipe_1.ingredient_count}| #{@recipe_1.ingredient_list}")
    expect(page).to have_content("ingredients needed: #{@recipe_2.ingredient_count}| #{@recipe_2.ingredient_list}")
  end
end
