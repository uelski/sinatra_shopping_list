require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./controllers/user')
require('./models/make_item')
require('./models/account')

map('/') {run UserController}
map('/item') { run ItemController }
