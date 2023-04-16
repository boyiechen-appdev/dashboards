class CurrenciesController < ApplicationController
  def first_currency
    # @raw_data = open("https://api.exchangerate.host//symbols").read
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys()
    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency
    @first_currency_symbol = params.fetch("first_currency_symbol")
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys()
    render({ :template => "currency_templates/step_two.html.erb" })
  end

  def exchg_rate

    # fetch user input URL
    @from_currency = params.fetch("from_currency")
    @to_currency = params.fetch("to_currency")

    @url = "https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}"
    @raw_data = open(@url).read
    @parsed_data = JSON.parse(@raw_data)
    @rate = @parsed_data.fetch("info").fetch("rate")

    render({ :template => "currency_templates/result.html.erb" })
  end
end
