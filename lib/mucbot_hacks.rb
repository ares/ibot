module Jabber
  class MUCBot
    def room
      @room
    end

    def roster
      @room.roster.keys
    end
  end
end