`// @ngInject`
angular.module('cobudget').factory 'ContributionModel',  (UserModel) ->
  class ContributionModel
    constructor: (data = {}) ->
      @id = data.id
      @amountCents = data.amount_cents
      @bucketId = data.bucket_id or data.bucket and data.bucket.id
      @user = new UserModel(data.user)

    serialize: ->
      return {
        id: @id,
        amount_cents: @amountCents
        bucket_id: @bucketId
        user: @user.serialize()
      }