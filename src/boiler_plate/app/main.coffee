AppNamespace = require './namespace'
{App} = require './components'
{FullScreenApp} = require 'art-engine'

FullScreenApp.init title: AppNamespace.namespace.name
.then -> App.instantiateAsTopComponent()
