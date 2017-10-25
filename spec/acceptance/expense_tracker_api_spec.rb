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

    def post_expenses(expense)
      post '/expenses', expense.to_json
      expect(last_response.status).to eq 200
      response = JSON.parse(last_response.body)
      expect(response).to include('expenses_id' => a_kind_of(Integer))
      response.merge!('id': response['expenses_id'])
      puts response
    end

    it 'records expenses' do
      coffee = { payee: 'Albion', cost: 5.23, date: '2017-10-07' }
      post_expenses(coffee)
      zoo = { payee: 'Bondla', cost: 10.23, date: '2017-11-07' }
      post_expenses(zoo)
    end

    it 'returns submitted expenses by date' do
      get 'expenses/2017-11-07'
      pending 'GET to be implemented'
      coffee = { payee: 'Albion', cost: 5.23, date: '2017-10-07' }
      post_expenses(coffee)
      zoo = { payee: 'Bondla', cost: 10.23, date: '2017-11-07' }
      post_expenses(zoo)
      expect(last_response.status).to eq 200
      expect(JSON.parse(last_response.body)).to contain_exactly(zoo)
    end
  end
end