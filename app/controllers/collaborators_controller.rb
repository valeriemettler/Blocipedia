class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
    @users = User.where("id is not ?", current_user.id)
  end

  def create
    @collaborator = @wiki.collaborators.build(user_id: params[:user_id])
    if @collaborator.save
      flash[:notice] = "You added a collaborator"
    else
      flash[:error] = "There was a problem creating this collaborator"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "You removed a collaborator"
    else
      flash[:error] = "There was a problem removing this collaborator"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  private

  def set_wiki 
    @wiki = Wiki.friendly.find(params[:wiki_id]) 
    #@wiki = Wiki.find(params[:wiki_id])
  end
end
