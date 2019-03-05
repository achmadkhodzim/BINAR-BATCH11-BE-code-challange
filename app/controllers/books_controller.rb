class BooksController < ApplicationController
  before_action :authenticate_admin, only: [:new, :edit, :update, :destroy]
  def new
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
  @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end
  def create

    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end
  def index
  # if session[:user_id].present?
  #   @user = User.find(session[:user_id])
  #   @articles = @user.articles.all
  # else
    @books = Book.all
  # end
  end
  def show
  @book = Book.find(params[:id])
end
def destroy
  @book = Book.find(params[:id])
  @book.destroy

  redirect_to book_path
end
  private
  def book_params
    params.require(:book).permit(:nama, :penerbit, :stok,:category_id)
  end
end
