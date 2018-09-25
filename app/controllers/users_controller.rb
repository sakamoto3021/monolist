class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.uniq
    @count_want = @user.want_items.count
    @count_have = @user.have_items.count
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success]='ユーザーを登録しました'
      redirect_to @user
    else
      flash.now[:danger]='ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
