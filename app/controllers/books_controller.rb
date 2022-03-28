class BooksController < ApplicationController

  def index
    @books = Book.all
    @books.order(:created_at)
  end

  def show
    @books = Book.find(params[:id])
    @recipes = Recipe.where(book_id: params[:id])
  end

  def recipe_index
    @books = Book.find(params[:id])
    @recipes = Recipe.where(book_id: params[:id])
  end
end
