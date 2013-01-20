module Plugins
  class Shout
    BIG_BROTHER_MENTION = /bigbrother/i
    GOOD_TIMES = /1984/

    def initialize(bot)
      bot.add_command(BIG_BROTHER_MENTION) do |sender, message|
        "BigBrother is watching you!"
      end

      bot.add_command(GOOD_TIMES) do |sender, message|
        "Jóoo 1984, to bývaly časy..."
      end
    end
  end
end