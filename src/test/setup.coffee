global._ = require('lodash')
require './support/require_globals'

global.app_require = (name) ->
  require("#{__dirname}/../app/#{name}")
global.testSubject = sinon.stub()
global.angular =
  module : ->
    factory: testSubject

