chai= require 'chai' 
chaiAsPromised = require 'chai-as-promised'
sinon_chai = require 'sinon-chai'

chai.use sinon_chai
chai.use chaiAsPromised

global.expect = chai.expect
global.promise = require('../support/promise')
global.sinon = require('sinon')
