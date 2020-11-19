# frozen_string_literal: true

require 'sinatra'
require_relative './lib/diary'
require './database_connection_setup'

class DiaryApp < Sinatra::Base
  enable :sessions, :method_override
  get '/' do
    redirect('/diary')
  end

  get '/diary' do
    erb :'/diary/index'
  end

  post '/diary' do
    Diary.create(title: params[:title], body: params[:body])
    redirect('/diary')
  end

  get '/diary/:entry' do
    @entry = Diary.select(params[:entry].to_i)
    erb :'/diary/entry'
  end

  delete '/diary/:entry' do
    Diary.delete(params[:entry].to_i)
    redirect('/diary')
  end
end
