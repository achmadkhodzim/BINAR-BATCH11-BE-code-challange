class OrdersController < ApplicationController
  before_action :authenticate_user
  def new
    @order=Order.new
  end

  def create
    tgl_ambil =Date.today
    tgl_sampai = Date.new params[:order]["tanggal_sampai(1i)"].to_i,params[:order]["tanggal_sampai(2i)"].to_i, params[:order]["tanggal_sampai(3i)"].to_i
    @user = User.find(session[:user_id])
    @book = Book.find(params[:order][:books_id])
    @order=Order.create status: 'Dipinjam', tanggal_ambil: tgl_ambil, tanggal_sampai: tgl_sampai, book: @book,user: @user

    if @order.save
      @book.update_attribute(:stok, @book.stok - 1)
      redirect_to '/orders'
    else
      render 'new'
    end
  end
  def bayar
  @order = Order.find(params[:id])

  @order.update_attribute(:denda, 0)
      redirect_to '/orders'
  end
  def index
  # if session[:user_id].present?
  #   @user = User.find(session[:user_id])
  #   @articles = @user.articles.all
  # else
   if session[:admin].present?
    @orders = Order.all
  else 
    @orders =@current_user.orders
  end

  # end
  end
  def edit
    @order = Order.find(params[:id])
  end
  def update
    tgl_balik = Date.today
  @orders = Order.find(params[:id])
  @book = Book.find(@orders.book_id)
  tgl_str1= @orders.tanggal_sampai.to_s
  tgl_str2= tgl_balik.to_s

  tgldue = Date.parse(tgl_str1)
  tgl_back = Date.parse(tgl_str2)

  telat= (tgldue..tgl_back).to_a
    if tgldue < tgl_back
      harga=(telat.length-1)*2000
    else
      harga=0
    end
  @book.update_attribute(:stok, @book.stok + 1)
    if @orders.update(status: "Sudah Kembali" , tanggal_dibalikin: tgl_balik ,denda: harga)
      redirect_to '/orders'
    else
      redirect_to '/books'
    end
  end
  private
  def order_params
    params.require(:order).permit(:tanggal_ambil, :tanggal_sampai, :books_id)
  end


end
