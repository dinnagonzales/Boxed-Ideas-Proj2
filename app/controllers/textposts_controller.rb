class TextpostsController < ApplicationController
  
  before_action :authenticate_user
  before_action :getidea

  def index
    @textposts = Textpost.all
  end

  def show
    @textpost =Textpost.find(params[:id])
  end  

  def new
    @textpost = Textpost.new 
  end


  def create
    @textpost = @idea.textposts.new(params.require(:textpost).permit(:subject, :date, :link, :content, :user, :picture ))
        
    if @textpost.save
      redirect_to idea_path(@idea)
    else
      render 'new'
    end
  end


  def edit
     @textpost = Textpost.find(params[:id])
  end

  def update
    @textpost = Textpost.find(params[:id])
    if @textpost.update_attributes(params.require(:textpost).permit(:subject, :date, :link, :content, :user, :picture ))    
      redirect_to idea_path(@idea)
    else
      render 'edit'
    end
  end

  def destroy
    @textpost = Textpost.find(params[:id])
    @textpost.destroy
    Textpost.where(textpost_id: @textpost.id).destroy
    redirect_to idea_path(@idea)
  end

private

def getidea
   @idea = Idea.find(params[:idea_id])
 end

end




