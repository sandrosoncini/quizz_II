class IdeasController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :authorize!, only: [:edit, :update, :destroy]
    
    def index
        @ideas = Idea.all.order created_at: :desc 
    end

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new(params.require(:idea).permit(:title, :description)) 
        @idea.user = @current_user
        if @idea.save  
            redirect_to ideas_path  
        else 
            render :new 
	    end
    end 

    def show
        @idea = Idea.find(params[:id])

        @review = Review.new
        @reviews = @idea.reviews.order(created_at: :desc)
        
    end

    def edit 
        @idea = Idea.find(params[:id])
    end 

    def update
        @idea = Idea.find(params[:id])
        if @idea.update(params.require(:idea).permit(:title, :description))
            redirect_to idea_path(@idea) 
        else 
            render :edit
	    end
    end

    def destroy
        id = params[:id]
        @idea = Idea.find(id)
        @idea.destroy
        redirect_to ideas_path
    end

    private

    def authorize! 
      @idea = Idea.find(params[:id])
      redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @idea)
    end


end
