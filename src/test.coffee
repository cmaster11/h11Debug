testFunction = ->
  process.env.DEBUG = 'H11D*'

  debug = require('./h11Debug')('testDebug')

  debug 'This is a test!'

testFunction()