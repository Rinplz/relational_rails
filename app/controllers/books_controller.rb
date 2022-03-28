class BooksController < ApplicationController

  def index
    @books = Book.all
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
