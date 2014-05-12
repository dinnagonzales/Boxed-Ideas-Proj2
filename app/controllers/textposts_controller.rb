class TextpostsController < ApplicationController
  def index
    @textposts = Textpost.all
  end

   def new
    @textpost = Textpost.new
  end

  def create
    @textpost = Textpost.new(params.require(:textpost).permit(:subject, :content, :user ))    
    if @textpost.save
      redirect_to textposts_path
    else
      render 'new'
    end
  end

  def show
    @textpost = Textpost.find(params[:id])
  end

  def edit
     @textpost = Textpost.find(params[:id])
  end

  def update
    @textpost = Textpost.find(params[:id])
    if @textpost.update_attributes(params.require(:textpost).permit(:subject, :content, :user ))    
      redirect_to textposts_path
    else
      render 'edit'
    end
  end

  def destroy
    @textpost = Textpost.find(params[:id])
    @textpost.destroy
    Textpost.where(textpost_id: @textpost.id).destroy
    redirect_to textposts_path
  end
end
