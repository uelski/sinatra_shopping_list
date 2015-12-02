require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./models/make_item')

map('/') { run TaskController }
