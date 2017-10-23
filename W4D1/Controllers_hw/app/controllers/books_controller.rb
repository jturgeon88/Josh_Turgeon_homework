class BooksController < ApplicationController
  def index
    # your code here
    @books = Books.all
    render :index
  end

  def new
    # your code here
    render :new
  end

  def create
    # your code here
    new_book = Book.new(given_paramaters)
    if new_book.save 
      redirect_to books_url
    else 
      flash.now[:errors] = new_book.full_messages
      new
    end 

  end

  def destroy
    # your code here
    new_book = Book.find(params[:id])
    new_book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
