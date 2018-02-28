class InvoicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @invoices = Invoice.all
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def new
    @invoice = Invoice.new
    @invoiceNumber = Invoice.last.id + 1
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoices = Invoice.all
    respond_to do |format|
      if @invoice.save
        format.js { render :index, notice: 'Invoice creado exitosamente' }
      else
        flash[:quote_errors] = @invoice.errors.full_messages
        format.js { render new_invoice_path, status: :unprocessable_entity }
      end
    end
  end

  private

    def invoice_params
      params.require(:invoice).permit(:date, :company_id, :client_id, :status, :balance, :tax, invoice_products_attributes: [:product_id, :product_quantity])
    end
end
