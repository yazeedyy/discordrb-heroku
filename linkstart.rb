require 'discordrb'
require 'configatron'
require 'json'
require 'nokogiri'
require_relative 'config/config.rb'

module Bot
    bot = Discordrb::Commands::CommandBot.new token: configatron.token, prefix: configatron.prefix, application_id: configatron.userid

    # Discord commands
    module DiscordCommands; end

    Dir['src/commands/*.rb'].each { |mod| load mod }
    DiscordCommands.constants.each do |mod|
    bot.include! DiscordCommands.const_get mod
    end

    # Discord events
    module DiscordEvents; end

    Dir['src/events/*.rb'].each { |mod| load mod }
    DiscordEvents.constants.each do |mod|
    bot.include! DiscordEvents.const_get mod
    end

    # Run the bot
    bot.run
end
