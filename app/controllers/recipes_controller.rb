class RecipesController < ApplicationController
before_action :authenticate

    def index
        user = User.find_by(id: session[:user_id])
        render json: user.recipes, include: :user, status: :created
    end

    def create
        user = User.find_by(id: session[:user_id])
        recipe = Recipe.new(recipe_params)
        recipe.user = user
        if recipe.valid?
            recipe.save
            render json: recipe, include: :user, status: :created
        else
            render json: { errors: ["Not a valid recipe"] }, status: :unprocessable_entity
        end
        
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

    def authenticate
        if session[:user_id].nil?
            render json: { errors: ["Not logged in!"] }, status: :unauthorized
        end
    end

end
