class SessionsController < ApplicationController
  skip_filter :check_session

  def new
  end

  def create
  	member = Member.authenticate(params[:email], params[:password])
  	if member
  		session[:member_id] = member.id
  		redirect_to root_url
  	else
  		flash[:notice] = "Either your username or password was invalid"
  		render "new"
  	end
  end

  def destroy
  	session[:member_id] = nil
  	redirect_to root_url, :notice => "Logged out successfully"
  end
end
