class UsersController < ApplicationController
    def new
    end

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id
            # puts 'error'
            return redirect_to user_path user.id 
        end
        flash[:errors] = user.errors.full_messages
        # puts 'contin'
        return redirect_to :back
    end

    def show
        @user = User.find(params[:id])
        @song = Song.all
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
