class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      redirect_to accounts_path, notice: 'Sua conta foi adicionada com sucesso'
    else
      render :new
    end
  end

  private

    def account_params
        params.require(:account).permit(:name, :initial_balance)
    end

    def set_account
      @account = Account.find(params[:id])
    end
end
