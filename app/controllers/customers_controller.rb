class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def new
    @customer = Customer.new
    @users = User.all
  end
  
  def index
    @customers = Customer.all
    @users = User.all
  end
  
  def edit
    @customer = Customer.find_by(id: params[:id])
  end
  
  def show
    @customer = Customer.find_by(id: params[:id])
    @user = User.find_by(id: @customer.user_id)
  end
  
  def update
    @customer = Customer.find_by(id: params[:id])
    @customer.update(customer_parameter)
    @customer.save
    flash[:notice] = "顧客情報を編集しました。"
    redirect_to customers_path
  end
  
  def create
    @customer = Customer.new(customer_parameter)
    @customer.user_id = current_user.id
    # 契約日は買付日から7日後をデフォルトで設定
    @customer.second_time = @customer.start_time + 7.days
    # 本審査日は契約日より7日後
    @customer.third_time = @customer.second_time + 7.days
    # 金消日は本審査日より21日後
    @customer.fourth_time = @customer.third_time + 21.days
    # 決済日は金消日から14日
    @customer.end_time = @customer.fourth_time + 14.days
    @customer.color = @customer.customer_color
    @customer.save
    redirect_to root_path
  end
  
  def calendar
    @customers = Customer.all
  end
  
  def user_calendar
    @customers = Customer.where(user_id: params[:id])
  end

  def destroy
    customer = Customer.find_by(id: params[:id])
    customer.destroy
    flash[:notice] = "顧客情報を削除しました。"
    redirect_to(customers_path)
  end
  
  def user_customer
    @customers = Customer.where(user_id: params[:id])
    @users = User.all
  end
  
  def ensure_correct_user
    @customer = Customer.find_by(id: params[:id])
    if @customer.user_id != current_user.id
      flash[:error] = "担当でない顧客の情報を編集することはできません。"
      redirect_to(customers_path)
    end
  end
  
  private

  def customer_parameter
    params.require(:customer).permit(:customer_name, :content, :start_time, :second_time, :third_time, :fourth_time, :end_time, :address, :phone)
  end
  
end
