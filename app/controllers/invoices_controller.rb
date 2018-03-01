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
      format.html
      format.pdf do
        render pdf: 'show'
      end
    end
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoices = Invoice.all
    respond_to do |format|
      if @invoice.save
        format.js { render :index, notice: 'Invoice creado exitosamente' }
      else
        flash.now[:quote_errors] = @invoice.errors.full_messages
        format.js { render new_invoice_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.update(deleted: 1)
    respond_to do |format|
      format.html { redirect_to invoices_path }
      format.js   { render :layout => false }
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.status == 1
      @invoice.update(:status => 0)
    else
      @invoice.update(:status => 1)
    end
    respond_to do |format|
      format.html { redirect_to "/invoices/#{@invoice.id}.pdf" }
      format.pdf do
        render pdf: 'show'
      end
    end
  end

  private

    def invoice_params
      params.require(:invoice).permit(:status, :company_id, :client_id, :date, :tax, :balance, :deleted, invoice_products_attributes: [:product_id, :product_quantity, :product_total_price])
    end
end
