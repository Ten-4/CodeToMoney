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
    sub = params[:submission]
    rp = RoundPlayer.where(user_id: sub[:user_id], round_id: sub[:round_id]).first
#    rp = RoundPlayer.find(round_player_params[:round_player_id])
    rp.update_attribute(:bet, sub[:bet])
    rp.save
    redirect_to '/'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def round_player_params
      params.require(:round_player).permit(:user_id, :round_id, :bet)
    end
end
