require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'assertions'
require 'ruby-debug' if Gem.available?('ruby-debug')

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'nebula'

