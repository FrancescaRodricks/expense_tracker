# rack-test -> testing apis
require 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker

  describe 'Expense Tracker API' do
    include Rack::Test::Methods

    def app
      ExpensesTracker::API.new
    end

    it 'records expenses' do
      coffee = { payee: 'Albion', cost: 5.23, date: '2017-10-07' }
      post '/expenses', coffee.to_json
    end
  end
end