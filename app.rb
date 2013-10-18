#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

# this auto-reloads files with changed mtime
Sinatra::Application.reset! 

require 'haml'
require 'sass'

# for debugging
require 'pp'
require 'yaml'

helpers do
end

before do
end

# use scss for stylesheets (link default.scss to prefered style)
get '/css/:style.css' do
  scss :"#{params[:style]}"
end

get '*' do
	@content = "hello!"
	haml :content
end
