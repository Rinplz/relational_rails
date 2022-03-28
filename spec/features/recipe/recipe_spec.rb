require 'rails_helper'

RSpec.describe "recipe pages", type: :feature do
  it 'can see all recipes and their attributes' do
    book_1 = Book.create(title: 'week night dinners', book_completed: false, rating: 4, author: 'taste of home')
    recipe_1 = book_1.Recipe.create(name: 'cajun salmon',ingredient_count: 3, ingredient_list: 'salmon, cajun seasoning, butter')
    recipe_2 = book_1.Recipe.create(name: 'nikujaga',ingredient_count: 4, ingredient_list: 'beef, potatoes, carrots, green beans')

    visit '/recipes'

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content("ingredients needed: #{recipe_1.ingredient_list}")
    expect(page).to have_content("ingredients needed: #{recipe_2.ingredient_list}")

  end
end
