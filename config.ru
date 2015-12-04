require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./models/make_item')
require('./models/account')

map('/') { run ItemController }
