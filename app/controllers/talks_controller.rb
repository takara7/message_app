class TalksController < ApplicationController
  before_action :set_talk, only: [:destroy]
  before_action :authenticate_user!

  # GET /talks
  # GET /talks.json
  def index
    @talkers = current_user.talk_users
  end

  # GET /talks/1
  # GET /talks/1.json
  def show
    @to_user = User.find(params[:id])
    @talks = Talk.talk_list(current_user, @to_user)
  end

  # POST /talks
  # POST /talks.json
  def create
    @talk = Talk.new(talk_params.merge({from_id: current_user.id}))

    respond_to do |format|
      if @talk.save
        format.js
        format.html { redirect_to @talk, notice: 'Talk was successfully created.' }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to talks_url, notice: 'Talk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_params
      params.require(:talk).permit(:to_id, :content)
    end
end
