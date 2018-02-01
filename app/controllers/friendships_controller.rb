class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        partial = render_to_string partial: "users/remove_friend_button",
                                   locals: {friendship: @friendship}
        format.json { render json: { partial: partial }, status: :created }
      else
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      partial = render_to_string partial: "users/add_friend_button",
                                 locals: {user: @friendship.to_user}
      format.json { render json: { partial: partial } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
