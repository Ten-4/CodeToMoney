class RoundPlayersController < ApplicationController

  def create
    @round_player = RoundPlayer.new(round_player_params)

    respond_to do |format|
      if @round_player.save
        format.html { redirect_to @round_player, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round_player }
      else
        format.html { render :new }
        format.json { render json: @round_player.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateBet
    rp = RoundPlayer.where(user_id: params[:user_id], round_id: params[:round_id])
    rp.bet = params[:bet]
    rp.save
    redirect_to '/'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def round_player_params
      params.require(:round_player).permit(:user_id, :round_id, :bet)
    end
end
