require 'sinatra'

class DiaryApp < Sinatra::Base
  get '/' do
    'Hello Diary'
  end
end