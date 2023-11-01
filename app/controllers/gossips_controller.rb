class GossipsController < ApplicationController
  
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
  
  #add method edit
  #add method update (ttt + save in BDD) 
  #add method destroy


  def show
    @gossip = Gossip.find(params[:id])
  end

  def index
    @gossips = Gossip.all
  end
end
