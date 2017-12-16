class AddsController < ApplicationController
    def show
      @user = User.find(params[:id])
      @song = User.find(params[:id]).songs_added
    end
end
