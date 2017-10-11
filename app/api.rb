require 'json'
require 'sinatra/base'

module ExpensesTracker
  class API < Sinatra::Base

    post '/expenses' do
      JSON.generate({expenses_id: 3})
    end

    get '/expenses/:date' do
      JSON.generate([{test: 1},{test:2}])
    end
  end
end