class SongsController < ApplicationController
    def create
      song = Song.new(song_params)
      song.user = User.find(session[:user_id])
      song.count = 0

      if song.save
        redirect_to :back
      else
        flash[:errors] = song.errors.full_messages
            redirect_to :back
      end
    end

    def show
      @title = Song.find(params[:id])
      @song = Song.find(params[:id]).user_added
    end

    def update
      song = Song.find(params[:id])
      number = song.count +1 
      song.update(count: number)
      Add.create(user: User.find(session[:user_id]),song: Song.find(params[:id]))
      redirect_to user_path
    end

    private
      def song_params
          params.require(:song).permit(:title, :artist)
      end
end
