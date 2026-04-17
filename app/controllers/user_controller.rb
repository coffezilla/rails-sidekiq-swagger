class UserController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(
            name: set_name,
            email: params[:email]
        )

        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(params[:id])
        
        @user.destroy
        
        head :no_content
    end

    private



end
