module Plugins
  class Greet
    GREETS = {
      'cheetah' => 'Správce *cheetah* vstoupil do místnosti, vítej!',
      'irena sovickova' => 'Kdepak dnes asi mají koprovku, Irčo?',
    }

    def initialize(bot)
      bot.welcome do |jid|
        username = User.new(jid).safe_name
        GREETS.keys.include?(username) ? "/me | #{GREETS[username]}" : nil
      end
    end
  end
end
