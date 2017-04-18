class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_user_info

  def authenticate
    command = AuthenticateUser.call(@email, @password)

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def register

  	command = AuthenticateUser.call(@email, @password)

  	if command.success?
      @user = User.find_by_email(@email)
  		render json: @user.attributes.merge(auth_token: command.result)
  	else
  		@user = User.new(user_params)
  		if @user.save
  			command = AuthenticateUser.call(@email, @password)
  			if command.success?
  				render json: @user.attributes.merge(auth_token: command.result)
  			else
  				render json: { error: command.errors }, status: :unauthorized
  			end
  		else
  			render_error
  		end

  	end
  end

  private

  def set_user_info
  	@email = params[:email]
  	@password = params[:password]
  end

  def user_params
		params.permit(:email, :password)
	end

	def render_error
		render json: { errors: @user.errors.full_messages}, status: :unprocessable_entity
	end

end