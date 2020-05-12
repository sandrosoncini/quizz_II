class LikesController < ApplicationController
    before_action :authenticate_user!
    

    def create 
        idea = Idea.find params[:idea_id]
        like = Like.new user: current_user, idea: idea
        if !can?(:like, idea)
            redirect_to root_path, alert: "can't like idea"
        elsif like.save 
            redirect_to root_path, notice: "Liked"
        else 
            redirect_to root_path, alert: "Not Liked"
        end
    end

    
    def destroy 
        like = Like.find params[:id]
  
        if can? :destroy, like 
            like.destroy
            redirect_to root_path, notice: 'Like removed'
        else
            redirect_to root_path, alert: "can't delete like"
        end
    end 
end
