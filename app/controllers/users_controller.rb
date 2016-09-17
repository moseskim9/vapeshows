class UsersController < ApplicationController

before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    @user.save
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :company, :password)
  end
end
