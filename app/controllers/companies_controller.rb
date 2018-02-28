class CompaniesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @companies = Company.all
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def new
    @company = Company.new
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def create
    @company = Company.new(company_params)
    @companies = Company.all
    respond_to do |format|
      if @company.save
        format.js { render :index, notice: 'Company creado exitosamente' }
      else
        flash[:quote_errors] = @company.errors.full_messages
        format.js { render new_invoice_path, status: :unprocessable_entity }
      end
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :nit, :direction, :city, :country)
    end
end
