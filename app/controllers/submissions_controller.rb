class SubmissionsController < ApplicationController
  include SubmissionsHelper
  before_action :set_submission, only: [:show]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create

    asd = submission_params
    asd.delete(:round_id)
    @submission = Submission.new(asd)
    @submission.user = current_user

    respond_to do |format|
      if @submission.save
        rp = RoundPlayer.where(round_id: submission_params[:round_id], user_id: submission_params[:user_id]).first
        rp.update_attribute(submission_id: @submission.id)

        judge_async(@submission)
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

#    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:code, :user_id, :task_id, :round_id)
    end
end
