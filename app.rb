require 'sinatra'
require 'csv'
require_relative 'isbn_master.rb'
require_relative 'csvthingermajig.rb'
require_relative 'buckettest.rb'
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
	bucket = bucket_read
	erb :file, locals: {fileread: fileread}
end
post '/read' do
	redirect '/read?'
end
get '/read' do
	erb :master
end
