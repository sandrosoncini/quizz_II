class IdeasController < ApplicationController
    
    def index
        @ideas = Idea.all.order created_at: :desc 
    end

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new(params.require(:idea).permit(:title, :description)) 
        if @idea.save  
            redirect_to ideas_path  
        else 
            render :new 
	    end
    end 

    def show
        @idea = Idea.find(params[:id])
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

    private 


end
