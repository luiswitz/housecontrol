class CreditCardExpensesController < ApplicationController
  def new
    @credit_card_expense = Expense.new
  end

  def create
    @credit_card_expense = Expense.new(credit_card_expense_params)
    @credit_card_expense.user_id = current_user.id
    if @credit_card_expense.save
      redirect_to expenses_path, notice: 'Sua despesa de cartão de crédito foi adicionada com sucesso'
    else
      render :new
    end
  end

  private

    def credit_card_expense_params
        params.require(:expense).permit(:description, :value, :date, :credit_card_id, :category_id, :is_payed)
    end

    def set_credit_card_expense
      @credit_card_expense = Expense.find(params[:id])
    end
end
