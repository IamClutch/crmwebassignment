# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.

require 'sinatra'
require_relative 'contact'

Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')

get '/contacts' do

  erb :contacts
end

get '/' do
  @crm_app_name = "Amins Website"
  erb :index
end

get '/contacts/new' do

  erb :new_contact
end

post '/contacts' do
  puts params
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
if @contact
  erb :show_contact
  else
    raise Sinatra::NotFound
  end
end
