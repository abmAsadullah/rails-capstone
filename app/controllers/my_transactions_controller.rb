class MyTransactionsController < ApplicationController
    def index
        @my_transactions = Transaction.all
    end
end
