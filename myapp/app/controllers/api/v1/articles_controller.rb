class Api::V1::ArticlesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @articles = @user.articles
        byebug
        render json: @articles
    end
end
