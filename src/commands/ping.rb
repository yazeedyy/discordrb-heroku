module Bot
    module DiscordCommands
        module Ping
            extend Discordrb::Commands::CommandContainer

            #ping command
            command(:ping) do |event|
                event.respond "Time taken : #{ Time.now - event.timestamp } seconds."
            end

        end
    end
end
