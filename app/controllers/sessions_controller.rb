class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email,password)
      flash[:success]="成功しましたログイン"
      redirect_to @user
    else
      flasf[:danger]="失敗しましたログイン"
      render :new
    end
  end

  def destroy
   session[:user_id]=nil
   flash[:success]="アウトしました"
   redirect_to root_url
  end
  
  def login(email,password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      
      session[:user_id] = @user.id 
      return true
    else
      return false
    end 
  end 
end
