# frozen_string_literal: true

require 'sinatra'

class DiaryApp < Sinatra::Base
  get '/' do
    'Hello Diary'
  end
  
  get '/diary' do
    erb :'/diary/display_entries'
  end
end
