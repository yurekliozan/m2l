require 'sinatra'
require 'json'
require 'sinatra/activerecord'

set :database, 'sqlite3:///membres.db'

class Membre < ActiveRecord::Base
end

get '/index.json' do
  content_type :json

  {
    presentation: "Bonjour et bienvenue",
    message: "Voici l'application web de la M2L"
  }.to_json
end

get '/' do
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do 
  Membre.create({
    nom:params[:nom],
    prenom:params[:prenom],
    datenaiss:params[:datenaiss],
    adresse:params[:adresse],
    cp:params[:cp],
    numtel:params[:numtel]
  })

  erb :"valform"
end

get '/membres.json' do
  content_type :json
  @membres = Membre.all

  {
    membres: @membres.map {|m|
      {
        id: m.id,
        prenom: m.prenom,
        nom: m.nom,
      }
    }

  }.to_json

end

get '/membres' do
  erb :membres
end

get '/membres/show/:id.json' do
  content_type :json
  @membre = Membre.find(params[:id])

  {
    id: @membre.id,
    prenom: @membre.prenom,
    nom: @membre.nom,
  }.to_json
end

get '/membres/show/:id' do
  erb :show
end
