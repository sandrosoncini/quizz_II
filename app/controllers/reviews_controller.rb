class ReviewsController < ApplicationController
    def create 

        @idea = Idea.find(params[:idea_id])
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user
        if @review.save
            redirect_to idea_path(@idea)
        else
            redirect_to root_path, alert: 'Not Authorized'
        end
      
    end

    def destroy 
        @review = Review.find params[:id]
        if can?(:crud, @review)
            @review.destroy 
            redirect_to idea_path(@review.idea)
        else 
            redirect_to root_path, alert: 'Not Authorized'
        end
    end


    private 
    
    def review_params 
        params.require(:review).permit(:body)
    end
end
