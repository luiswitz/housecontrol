class ExpensesController < ApplicationController
  before_action :set_income, only: [:edit]

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    if @expense.save
      redirect_to expenses_path, notice: 'Sua despesa foi adicionada com sucesso'
    else
      render :new
    end
  end

  def edit

  end

  private

    def expense_params
        params.require(:expense).permit(:description, :value, :date, :category_id, :is_payed)
    end

    def set_income
      @expense = Expense.find(params[:id])
    end

end
