require '../../setup'
app_require('common/models/bucket')

contributor = sinon.stub()
authService = sinon.stub()
BucketModel = testSubject.getCall(0).args[1](contributor, authService)

describe 'BucketModel', ->
  beforeEach ->
    @bucket = new BucketModel({})
  it 'loads library', ->
    console.log @bucket
    

