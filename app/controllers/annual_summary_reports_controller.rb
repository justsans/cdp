class AnnualSummaryReportsController < ApplicationController
  before_action :set_annual_summary_report, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @annual_summary_report.save
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
