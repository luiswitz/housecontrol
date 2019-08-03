# frozen_string_literal: true

user = User.create(name: 'User Test', email: 'test@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')

Category.create(name: 'Combustível', user: user, kind: :expense)
Category.create(name: 'Restaurantes', user: user, kind: :expense)
Category.create(name: 'Bares', user: user, kind: :expense)
Category.create(name: 'Cursos', user: user, kind: :expense)
Category.create(name: 'Estacionamento', user: user, kind: :expense)
Category.create(name: 'Salário', user: user, kind: :income)
Category.create(name: 'Dividendos', user: user, kind: :income)
Category.create(name: 'Alugueis', user: user, kind: :income)
Category.create(name: 'Alugueis', user: user, kind: :income)

CreditCardFlag.create(name: 'Visa')
CreditCardFlag.create(name: 'Master Card')
CreditCardFlag.create(name: 'American Express')
CreditCardFlag.create(name: 'Elo')

offset = rand(CreditCardFlag.count)
CreditCard.create(name: 'Santander Fit', credit_card_flag: CreditCardFlag.offset(offset).first, due_date: 10, closing_at: 27, limit: 5000.00, user: user)

offset = rand(CreditCardFlag.count)
CreditCard.create(name: 'Nubank', credit_card_flag: CreditCardFlag.offset(offset).first, due_date: 10, closing_at: 27, limit: 1000.00, user: user)

1000.times do
  FactoryGirl.create(:expense, category: Category.expense.sample, user: user)
end
