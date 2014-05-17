class IdeasController < ApplicationController
  
  before_action :authenticate_user

  def index
    @ideas = current_user.ideas.all
  end

  def edit
    @idea =Idea.find(params[:id])
  end

  def show
    @idea =Idea.find(params[:id])
  end

  def new
    @idea = current_user.ideas.build
  end

  def create
    @idea = Idea.new(params.require(:idea).permit(:title, :published, :user_id ))
        
    if @idea.save
      redirect_to ideas_path
    else
      render 'new'
    end
  end


  def update
    @Idea = Idea.find(params[:id])
    if @Idea.update_attributes(params.require(:idea).permit(:title, :published, :user_id ))
      redirect_to ideas_path
    else
      render 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    Textpost.where(idea_id: @idea.id).destroy
    @idea.destroy
    redirect_to ideas_path


  end
end
