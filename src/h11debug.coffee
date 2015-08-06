util = require 'util'

ucFirst = (str) ->
  return str.charAt(0).toUpperCase() + str.slice(1)

module.exports = (namespace) ->

  if process.env.DEBUG?
    if process.env.DEBUG.indexOf 'H11D*' > -1 and process.env.DEBUG.indexOf 'H11-*' is -1
      process.env.DEBUG += ', H11-*'

  namespace = 'H11-' + ucFirst namespace

  _debugEnabled = false

  if (namespaces = process.env.DEBUG)?
    split = namespaces.split(/[\s,]+/)
    for value in split
      if value is '' then continue
      value = value.replace /\*/g, '.*?'
      regex = new RegExp "^#{value}$"
      if regex.test namespace
        _debugEnabled = true
        break

  _debug = require('debug')(namespace)
  _debug.namespace = namespace

  debug = ->
    unless _debugEnabled
      return

    args = []
    for key, value of arguments
      args.push value
    _debug util.inspect(args, {depth:null})

  debug.namespace = _debug.namespace

  return debug
