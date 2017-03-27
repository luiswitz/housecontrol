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

1000.times do
  FactoryGirl.create(:expense, category: Category.expense.sample, user: user)
end
