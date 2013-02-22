module Plugins
  class Greet
    GREETS = {
      'cheetah' => '/me Správce *cheetah* vstoupil do místnosti, vítej!',
    }

    def initialize(bot)
      bot.welcome do |jid|
        username = User.new(jid).safe_name
        GREETS.keys.include?(username) ? GREETS[username] : nil
      end
    end
  end
end
