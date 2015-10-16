null

### @ngInject ###
global.cobudgetApp.run ($rootScope, Records, $q, $location, $auth, Toast) ->

  console.log('boot.coffee has loaded')

  userValidatedDeferred = $q.defer()
  global.cobudgetApp.userValidated = userValidatedDeferred.promise
  console.log('[before] global.cobudgetApp.userValidated.$$state.status: ', global.cobudgetApp.userValidated.$$state.status)

  membershipsLoadedDeferred = $q.defer()
  global.cobudgetApp.membershipsLoaded = membershipsLoadedDeferred.promise
  console.log('[before] global.cobudgetApp.membershipsLoaded.$$state.status: ', global.cobudgetApp.membershipsLoaded.$$state.status)

  meowDeferred = $q.defer()
  console.log('[before] meowDeferred.promise: ', meowDeferred.promise)


  $auth.validateUser()
    .catch ->
      console.log('validateUser catch')
      onAuthError()

  onAuthSuccess = (user) ->
    global.cobudgetApp.currentUserId = user.id
    userValidatedDeferred.resolve()
    Records.memberships.fetchMyMemberships().then (data) ->
      console.log('memberships loaded!')
      membershipsLoadedDeferred.resolve(data)
      console.log('[after] global.cobudgetApp.userValidated: ', global.cobudgetApp.userValidated)
      console.log('[after] global.cobudgetApp.membershipsLoaded: ', global.cobudgetApp.membershipsLoaded)

  $rootScope.$on 'auth:validation-success', (ev, user) ->
    console.log('auth:validation-success signal fired!')
    onAuthSuccess(user)

  $rootScope.$on 'auth:login-success', (ev, user) ->
    console.log('auth:login-success signal fired!')
    onAuthSuccess(user)
    Records.memberships.fetchMyMemberships().then (data) ->
      membershipsLoadedDeferred.resolve(data)
      console.log('about to redirect to groups')
      groupId = data.groups[0].id
      Toast.show('Welcome to Cobudget!')
      $location.path("/groups/#{groupId}")

  onAuthError = () ->
    console.log('auth error!')
    membershipsLoadedDeferred.reject()
    global.cobudgetApp.currentUserId = null
    Toast.show('Please log in to continue')
    $location.path('/')

  $rootScope.$on '$stateChangeError', (e, toState, toParams, fromState, fromParams, error) ->
    # console.log('e: ', e)
    # console.log("stateChangeError: ", error)
    console.log(e, toState, toParams, fromState, fromParams, error)
    unless error?
      e.preventDefault()

    if error && error.reason == "unauthorized" && error.errors[0] == "No credentials"
      e.preventDefault()
      onAuthError()