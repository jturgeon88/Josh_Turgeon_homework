class BooksController < ApplicationController

  def index
    book = Books.all
    render json: book
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book
  end

end