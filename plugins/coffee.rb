# encoding UTF-8
module Plugins
  class Coffee
    COFFEE = /(^|\s)(?:kafe|káv|kav|kávičk)([aeěiouy]|(ou|ami))?[\s\?!\.]/i

    def initialize(bot)
      bot.add_command(COFFEE) do |sender, message|
        "Kávu by měl/a uvařit #{BaristPicker.new(bot.roster).suggest}."
      end
    end
  end
end
