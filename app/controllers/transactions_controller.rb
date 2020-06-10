class TransactionsController < ApplicationController
before_action :authenticate_user!
  #before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  access user: {
    except: [:destroy, :new, :create, :edit]},
    admin: :all, 
    landlord: :all, 
    tenant: {except: [:destroy, :new, :create]}
  layout 'service'
  # GET /transactions
  def index
  end
  # GET /transactions/1
  def show
    @transaction = Transaction.find(params[:id])
   end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    #@transaction=current_user.service.transactions.build
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    #@transaction=current_user.service.transactions.build(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
    redirect_to services_url, notice: 'transaction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:id,:name, :description, :item, :Committed_Value, :appliance_id, :contract_id)
    end
end
