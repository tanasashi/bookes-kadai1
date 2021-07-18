class BooksController < ApplicationController

  def index
     @books = Book.all.order(created_at: :asc)
     @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully update.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created.'
    redirect_to book_path(@book)
    else
      @books = Book.all.order(created_at: :desc)
      render :index
    end

  end

 def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
 end

 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end


