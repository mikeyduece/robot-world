require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end
  
  get '/robots' do
    @robots = Robot.all
    erb :index
  end
  
  get '/robots/new' do
    erb :new
  end
  
  post '/robots' do
    robot = Robot.new(params)
    # require "pry"; binding.pry
    robot.save
    redirect '/robots'
  end
end

