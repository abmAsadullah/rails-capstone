module TransactionsHelper
  def all_transactions(transactions)
    transactions.sum(:amount)
  end
end
