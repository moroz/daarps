class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:success] = "Zostałeś pomyślnie zalogowany."
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:warning] = "Wystąpił problem przy logowaniu."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Zostałeś pomyślnie wylogowany."
    redirect_to "/"
  end
end
