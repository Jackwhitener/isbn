require 'sinatra'
require_relative 'isbn10_checker.rb'
require_relative 'isbn13_checker.rb'

get '/' do
	erb :home
end
post '/result' do
	number = params[:number]
	isbntype = params[:isbntype]
	if isbntype == '10'
		valid = checkten(number)
	elsif isbntype == '13'
		valid = checkthirteen(numberlengththirteen(number),number)
	end
	redirect '/result?number=' + number + '&isbntype=' + isbntype + '&valid=' + valid.to_s
end
get '/result' do
	number = params[:number]
	isbntype = params[:isbntype]
	valid = params[:valid]
	erb :result, locals: {number: number, isbntype: isbntype, valid: valid}
end