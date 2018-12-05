require 'sinatra'
require_relative 'isbn10_checker.rb'
require_relative 'isbn13_checker.rb'

get '/' do
erb :home
end
