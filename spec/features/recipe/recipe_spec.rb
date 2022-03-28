require 'rails_helper'

RSpec.describe "recipe pages", type: :feature do
  it 'can see all recipes and their attributes' do
    book_1 = Book.create!(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')
    recipe_1 = Recipe.create!(name: 'cajun salmon',ingredient_count: 3, ingredient_list: 'salmon, cajun seasoning, butter', book_id: Book.first.id)
    recipe_2 = Recipe.create!(name: 'nikujaga',ingredient_count: 4, ingredient_list: 'beef, potatoes, carrots, green beans', book_id: Book.first.id)

    visit '/recipes'

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content("ingredients needed: #{recipe_1.ingredient_count}| #{recipe_1.ingredient_list}")
    expect(page).to have_content("ingredients needed: #{recipe_2.ingredient_count}| #{recipe_2.ingredient_list}")

  end

  it 'can show a specific recipe and its attributes' do
      book_1 = Book.create!(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')
      recipe_1 = Recipe.create!(name: 'cajun salmon',ingredient_count: 3, ingredient_list: 'salmon, cajun seasoning, butter', book_id: Book.first.id)
      recipe_2 = Recipe.create!(name: 'nikujaga',ingredient_count: 4, ingredient_list: 'beef, potatoes, carrots, green beans', book_id: Book.first.id)

      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content(recipe_1.name)
      expect(page).to have_content("ingredients needed: #{recipe_1.ingredient_count}| #{recipe_1.ingredient_list}")
  end
end
