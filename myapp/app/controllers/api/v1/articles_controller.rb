class Api::V1::ArticlesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @articles = @user.articles
        render json: @articles, each_serializer: ArticleSerializer
    end
end
