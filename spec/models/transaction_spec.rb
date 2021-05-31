require 'rails_helper'

RSpec.describe Transaction, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password',
                                       password_confirmation: 'password')
  transaction = Transaction.new(name: 'perros', amount: 500, user: current_user, group_id: 1)

  context 'testing the validations' do
    it 'validate amount be a integer' do
      expect(transaction.amount).to be_a(Integer)
    end
    it "doesn't create a transaction with an empty name" do
      transaction = Transaction.create(name: '')
      expect(transaction.valid?).to eq false
    end

    context 'tests for the controllers' do
      it 'test controller new' do
        transaction = Transaction.new(
          name: 'perros',
          amount: 500,
          user: current_user
        )
        expect(transaction.save).to eq(false)
      end
    end
  end
end
