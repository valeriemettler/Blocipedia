class WikisController < ApplicationController

  def index
    @wikis = Wiki.visible_to(current_user)
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
     @wiki = current_user.wikis.build(wiki_params)
    
     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

  def edit
    @wiki = Wiki.friendly.find(params[:id])

  end

  def update
     @wiki = Wiki.friendly.find(params[:id])

     if @wiki.update_attributes(wiki_params)
       flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

   def destroy
     @wiki = Wiki.friendly.find(params[:id])
    
     title = @wiki.title
 
     if @wiki.destroy
       flash[:notice] = "Wiki was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
   end

   private

   def wiki_params
    params.require(:wiki).permit(:title, :body)
   end


end
