# -*- coding: utf-8 -*-
class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #.saveではなく.registered?
    @user = User.new(login_params)

    if @user.registered?
      session[:login] = @user.id
      redirect_to todos_path
    else
      render action: 'new'
    end
  end

  def destroy
    # destroyではなく...
    @user = User.new(id: params[:id])
    session[:login] = nil
    render action: 'new'
  end

  private
  def login_params
    params.require(:user).permit(:email, :password, :id)
  end
end
