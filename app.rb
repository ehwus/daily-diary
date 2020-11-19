# frozen_string_literal: true

require 'sinatra'
require_relative './lib/diary'

class DiaryApp < Sinatra::Base
  get '/' do
    'Hello Diary'
  end

  get '/diary' do
    erb :'/diary/index'
  end

  post '/diary' do
    Diary.create(title: params[:title], body: params[:body])
    redirect('/diary')
  end
end
