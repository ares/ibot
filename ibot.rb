#!/usr/bin/ruby1.8

require 'rubygems'
require 'bundler'
require 'jabber/mucbot'
require 'pry'
require 'yaml'

require 'lib/user'
require 'lib/mucbot_hacks'

Dir.glob('plugins/*').each do |plugin|
  require plugin
end

class Bot
  attr_accessor :bot, :config
  include Plugins

  def initialize
    @config = YAML.load_file('config.yml')
    @bot = Jabber::MUCBot.new(config)
    Plugins.constants.each do |plugin|
      Plugins.const_get(plugin).new(bot)
    end
  end

  def start
    @bot.join
  end
end

# Add a custome welcome message
#bot.welcome { |guy| "Vitej #{guy}!" }

# Bring your new bot to life
Bot.new.start

