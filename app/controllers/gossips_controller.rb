class GossipsController < ApplicationController
  
  def index
    @gossips = Gossip.all
  end
  
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end
  
  def create #treate infos and save into DB
    @gossip = Gossip.new(
      'title' => params[:title],
      'content' => params[:content], 
      'user_id' => User.all.sample.id)

    if @gossip.save
      flash[:success] = "Thanks for your Gossip XOXO"
      redirect_to "/"
    else
      @gossip.errors.full_messages.each do |message|
        flash[:error] = message
      end
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id]) #cf find_by de Sam
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(post_params) #rechercher dans vidéo ceux à quoi correspond post_params ou sinon copier ligne 16 à 19
    redirect_to "/"
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/"
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content)
  end
end
