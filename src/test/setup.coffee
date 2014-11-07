global._ = require('lodash')
require './support/require_globals'

#TODO: get rid of globals, return object to unit test using module.exports
global.app_require = (name) ->
  require("#{__dirname}/../app/#{name}")
testConstructor = sinon.stub()
global.angular =
  module : ->
    factory: testConstructor
    controller: testConstructor

global.testSubject = ->
  testConstructor.getCall(0).args[1]

