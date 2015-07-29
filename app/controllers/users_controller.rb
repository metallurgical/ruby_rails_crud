class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create( permit_params )
  	if @user.save  		
  		flash[:notice] = "Successful Register Into this system"
  		redirect_to new_user_path
  	else
  		flash[:notice] = "Can't sign up"
  		render 'new'
  	end
  end

  def signin
  end

  def signout
  	session[:user_id] = nil
  	redirect_to :action => 'signin'
  end

  # this is for form 1, custom form
  def signinProcess
  	user = User.where('email = ?', params[:email] ).first
  	if user && user.authenticate( params[:password] )
  		session[:user_id] = user.id
  		flash[:notice] = "Successful Login"
  		redirect_to :action => 'signin' ,:id => user.id
  	else
  		flash[:notice] = "Can't sign in"
  		render 'signin'
  	end
  end

=begin 
this if for form 2(build in form using form_for and model)
  def signinProcess
  	user = User.where('email = ?', params[:user][:email] ).first
  	if user && user.authenticate( params[:user][:password] )
  		flash[:notice] = "Successful Login"
  		redirect_to :action => 'signin'
  	else
  		flash[:notice] = "Can't sign up"
  		render 'signin'
  	end
  end
=end


  def edit
  end

  private
  	def permit_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation )
  	end
end
