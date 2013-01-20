module Plugins
  class Coffee
    COFFEE = /(?:kafe|kav|kavicka)/i

    def initialize(bot)
      bot.add_command(COFFEE) do |sender, message|
        "Kávu by měl/a uvařit #{BaristPicker.new(bot.roster).suggest}."
      end
    end
  end
end