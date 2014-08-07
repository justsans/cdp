class FeedbackSectionsController < ApplicationController
  before_filter :load_parent
  before_action :set_feedback_section, only: [:show, :edit, :update, :destroy]

  # GET /feedback_sections
  # GET /feedback_sections.json
  def index
    @feedback_sections = @feedback.feedback_sections
  end

  # GET /feedback_sections/1
  # GET /feedback_sections/1.json
  def show
  end

  # GET /feedback_sections/new
  def new
    @feedback_section = FeedbackSection.new
  end

  # GET /feedback_sections/1/edit
  def edit
  end

  # POST /feedback_sections
  # POST /feedback_sections.json
  def create
    @feedback_section = FeedbackSection.new(feedback_section_params)

    respond_to do |format|
      if @feedback_section.save
        format.html { redirect_to @feedback_section, notice: 'Feedback section was successfully created.' }
        format.json { render :show, status: :created, location: @feedback_section }
      else
        format.html { render :new }
        format.json { render json: @feedback_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_sections/1
  # PATCH/PUT /feedback_sections/1.json
  def update
    respond_to do |format|
      if @feedback_section.update(feedback_section_params)
        format.html { redirect_to @feedback_section, notice: 'Feedback section was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback_section }
      else
        format.html { render :edit }
        format.json { render json: @feedback_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_sections/1
  # DELETE /feedback_sections/1.json
  def destroy
    @feedback_section.destroy
    respond_to do |format|
      format.html { redirect_to feedback_sections_url, notice: 'Feedback section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_section
      @feedback_section = FeedbackSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_section_params
      params.require(:feedback_section).permit(:feedback_id, :question, :answer, :rating, :question_type, :action_plan, :category)
    end

    def load_parent
          @feedback = Feedback.find(params[:feedback_id])
    end
end
