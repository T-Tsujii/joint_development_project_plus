class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "ユーザーを登録しました。"
    else
      flash.now[:alert] = "ユーザーの登録に失敗しました。"
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザーを編集しました。"
    else
      flash.now[:alert] = "ユーザーの編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, alert: "ユーザーを削除しました。"
    else
      redirect_to users_path, alert: "ユーザーの削除に失敗しました。"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :age)
    end
end
