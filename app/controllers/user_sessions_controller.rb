class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
    @user = User.new
      respond_to do |format|
        format.html
        format.js
    end
  end

  def create
    respond_to do |format|
      if @user = login(params[:email], params[:password])
        format.html { redirect_back_or_to(:users, :notice => 'Login successful.') }
        # format.xml { render :xml => @user, :status => :created, :location => @user }
        format.js
      else
        format.html { flash.now[:alert] = "Login failed."; render :action => "new" }
        # format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { logout; redirect_to(:users, :notice => 'Logged out!') }
      format.js {logout }
    end
  end
end