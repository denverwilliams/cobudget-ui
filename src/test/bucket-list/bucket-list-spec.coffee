require '../setup'
app_require('bucket-list/bucket-list')

#TODO stub out methods called by constructor
$scope = sinon.stub()
$stateParams = sinon.stub()
RoundService = sinon.stub()
ContributionService = sinon.stub()
AuthService = sinon.stub()
BucketService = sinon.stub()
latestRound = sinon.stub()

describe 'BucketListCtrl', ->
  before ->
    @controller = testSubject()($scope, $stateParams, RoundService, ContributionService, AuthService, BucketService, latestRound)
  it 'tests', ->
    console.log 'hola'
