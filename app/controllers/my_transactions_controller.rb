class MyTransactionsController < ApplicationController
  def index
    @my_transactions = Transaction.all.order('created_at DESC')
  end
end
