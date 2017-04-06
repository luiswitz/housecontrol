class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit]

  def index
    @filtered_month = params[:q].present? ? params[:q][:month_eq].to_i : Date.today.month
    @search = current_user.expenses.search(params[:q])
    @expenses = @search.result
  end

  def new
    @expense = Expense.new(expensed_at: Date.today)
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

  def create_parcels
    @parcels = []
    n_parcels = params[:parcels].to_i
    total = params[:total_value].to_f
    expensed_at = params[:expensed_at]
    n_parcels.times { |i| @parcels << Parcel.new(number: i + 1, value: total / n_parcels, due_date: expensed_at.to_date + (i+1).months ) }
    respond_to do |format|
      format.js
    end
  end

  def edit

  end

  private

    def expense_params
        params.require(:expense).permit(:description, :value, :expensed_at, :category_id, :paid, :parceled, :credit_card_id, :form_of_payment, :parcels_attributes => [:value, :due_date, :number])
    end

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def calculate_parcels(total_value, number_of_parcels, initial_date)
      parcels = []
      value = total_value / number_of_parcels
      number_of_parcels.times { parcels << Expense.new(value: value, due_date: '') }
      parcels
    end

end
