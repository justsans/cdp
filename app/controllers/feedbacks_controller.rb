class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.where(status_id: 2)
    @feedback_requests = Feedback.where(status_id: 1)
  end

  def pending
    @feedbacks = Feedback.where(status_id: 1)
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user_id = current_user.id
    @feedback.status_id = 2;
    sections = params[:sections]

    #puts "Sections ######"
    #puts sections

    respond_to do |format|
      if @feedback.save
        for section in sections
          feedbackSection = FeedbackSection.new
          feedbackSection.feedback_id = @feedback.id
          feedbackSection.question = section["question"]
          feedbackSection.answer = section["answer"]

          feedbackSection.rating = 0
          feedbackSection.question_type = 1
          feedbackSection.action_plan = ''
          feedbackSection.category = ''
          feedbackSection.save
        end

        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end


  def sendFeedbackRequest
    requestBody = ActiveSupport::JSON.decode(request.body.read)

    puts "Sections ######"
    puts requestBody

    for recipient in requestBody['recipients']
      feedback = Feedback.new
      feedback.user_id = current_user.id
      feedback.status_id = 1
      feedback.date_requested = Date.today
      feedback.from_user_name = recipient['name']
      feedback.from_user_email = recipient['email']
      feedback.from_user_role = recipient['role']
      feedback.save

      for question in requestBody['questions']
        feedbackSection = FeedbackSection.new
        feedbackSection.feedback_id = feedback.id
        feedbackSection.question = question["question"]
        feedbackSection.answer = ''

        feedbackSection.rating = 0
        feedbackSection.question_type = question["type"]
        feedbackSection.action_plan = ''
        feedbackSection.category = ''
        feedbackSection.save
      end
    end

    respond_to do |format|
      format.html { redirect_to feedbacks_url}
      format.json { head :no_content }
    end
  end


  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    sections = params[:sections]

    respond_to do |format|
      if @feedback.update(feedback_params)
        for section in sections
          if section["id"] == 0 || section["id"] == ""
            feedbackSection = FeedbackSection.new
          elsif
            feedbackSection = FeedbackSection.find(section["id"])
          end

          feedbackSection.feedback_id = @feedback.id
          feedbackSection.question = section["question"]
          feedbackSection.answer = section["answer"]

          feedbackSection.rating = 0
          feedbackSection.question_type = 1
          feedbackSection.action_plan = ''
          feedbackSection.category = ''
          feedbackSection.save
        end
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:user_id, :from_user_id, :from_user_name, :from_user_email, :status_id, :date, :from_user_role, :project)
    end
end
