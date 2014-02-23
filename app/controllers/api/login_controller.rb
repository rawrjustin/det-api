class Api::LoginController < ApplicationController
  
  def authenticate
    @facebook_user = FbGraph::User.me(params[:authToken]).fetch
    @current_user = User.find_by_facebook_id(@facebook_user.identifier)
    if !@current_user
      @current_user = User.new(:name => @facebook_user.name, :email => @facebook_user.email, :facebook_id => @facebook_user.identifier)
      if @current_user.save
        respond_to do |format|
          format.json{render :json => @current_user}
        end
      end
    else
      respond_to do |format|
        format.json{render :json => @current_user}
      end
    end
  end
  
end
