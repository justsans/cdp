class AnnualSummaryReportsController < ApplicationController
  before_action :set_annual_summary_report, only: [:show, :edit, :update, :destroy, :answer]

  # GET /annual_summary_reports
  # GET /annual_summary_reports.json
  def index
    @annual_summary_reports = AnnualSummaryReport.where(user: current_user).order(:year).reverse_order
  end

  # GET /annual_summary_reports/1
  # GET /annual_summary_reports/1.json
  def show
  end

  # GET /annual_summary_reports/new
  def new
    @annual_summary_report = AnnualSummaryReport.new
  end

  # GET /annual_summary_reports/1/edit
  def edit
  end

  # POST /annual_summary_reports
  # POST /annual_summary_reports.json
  def create
    @annual_summary_report = AnnualSummaryReport.new(annual_summary_report_params)

    #create default questions
    questions = Question.all


    respond_to do |format|
      if @annual_summary_report.save
        for question in questions
          answer = Answer.new
          answer.question = question.question
          answer.question_id = question.id
          answer.answer = '';
          answer.section_id = question.section_id
          answer.annual_summary_report_id  = @annual_summary_report.id
          answer.save
        end

        format.html { redirect_to @annual_summary_report, notice: 'Annual summary report was successfully created.' }
        format.json { render :show, status: :created, location: @annual_summary_report }
      else
        format.html { render :new }
        format.json { render json: @annual_summary_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annual_summary_reports/1
  # PATCH/PUT /annual_summary_reports/1.json
  def update
    respond_to do |format|
      if @annual_summary_report.update(annual_summary_report_params)
        format.html { redirect_to @annual_summary_report, notice: 'Annual summary report was successfully updated.' }
        format.json { render :show, status: :ok, location: @annual_summary_report }
      else
        format.html { render :edit }
        format.json { render json: @annual_summary_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annual_summary_reports/1
  # DELETE /annual_summary_reports/1.json
  def destroy
    @annual_summary_report.destroy
    respond_to do |format|
      format.html { redirect_to annual_summary_reports_url, notice: 'Annual summary report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /annual_summary_report/1/answer
  def answer
    #section = params[:section]
    #questions = params[:question]
    #answers = params[:answer]

    answers = ActiveSupport::JSON.decode(request.body.read)
    puts answers

    puts "#####question[1]"
    puts answers["1"][0]["answer"]
    puts '#######'

    answers["1"].each_with_index do |answer,index|
      questionArray = Question.where(question: answer["question"])
      answerArray = Answer.where(question: answer["question"]).where(annual_summary_report_id: @annual_summary_report.id)

      if answerArray.nil? || answerArray.empty?
        updatedAnswer = Answer.new
      else
        updatedAnswer = answerArray[0]
      end

      if !questionArray.nil? && !questionArray.empty?
        updatedAnswer.question_id = questionArray[0].id
      end

      updatedAnswer.question =  answer["question"]
      updatedAnswer.answer = answer["answer"]
      updatedAnswer.annual_summary_report_id  = @annual_summary_report.id
      updatedAnswer.save

    end

    respond_to do |format|
      format.html { redirect_to @annual_summary_report, notice: 'Form Saved.' }
      format.json { render :show, status: :ok, location: @annual_summary_report }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annual_summary_report
      @annual_summary_report = AnnualSummaryReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annual_summary_report_params
      params.require(:annual_summary_report).permit(:user_id, :title, :year, :status)
    end
end
