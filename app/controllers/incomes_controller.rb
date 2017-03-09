class IncomesController < ApplicationController
  before_action :set_income, only: [:edit]

  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.user_id = current_user.id
    if @income.save
      redirect_to incomes_path, notice: 'Seu rendimento foi adicionado com sucesso'
    else
      render :new
    end
  end

  def edit
  end

  private

    def income_params
        params.require(:income).permit(:description, :value, :date, :category_id, :received)
    end

    def set_income
      @income = Income.find(params[:id])
    end
end
