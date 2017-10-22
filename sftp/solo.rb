root = File.expand_path('.')
cookbook_path [ root, File.absolute_path(File.dirname(__FILE__)) + '/cookbooks' ]
minimal_ohai true
