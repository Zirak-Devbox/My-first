class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, only: [:edit, :update, :delete]
  def new
    @user = User.new
  end

  def edit
    
  end

  def update
    
    if @user.update(user_params)
      flash[:notice]= "Your account has successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
   @user= User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      flash[:notice]= "Welcome #{@user.username} You have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
    
  end

  def show
    @articles= @user.articles.paginate(page: params[:page], per_page: 3)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def destroy
    @user = User.find(params[:id])
    
    session[:user_id] = nil if @user == current_user
    @user.destroy
    flash[:notice] = "Account successfully deleted"
    redirect_to articles_path
  end

  private
    def set_user
      @user= User.find(params[:id])
    end

    def require_user
      if current_user != @user && ! current_user.admin?
        flash[:alert] = "You can edit or delete only your's profile"
        redirect_to @user
      end            
    end

end