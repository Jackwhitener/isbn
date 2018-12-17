require 'sinatra'
require 'csv'
require_relative 'isbn10_checker.rb'
require_relative 'isbn13_checker.rb'
require_relative 'csvthingermajig.rb'

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
post '/file' do
  fileread = params[:isbn]
  redirect '/file?fileread=' + fileread
end
get '/file' do
	fileread = read(params[:fileread])
	erb :file, locals: {fileread: fileread}
end