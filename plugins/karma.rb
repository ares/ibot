module Plugins
  class Karma
    NICK          = '[^ ]+'
    PLUS_HANDLER  = /\A(?:.* )?(#{NICK})\+{2}.*\Z/
    MINUS_HANDLER = /\A(?:.* )?(#{NICK})-{2}.*\Z/
    QUERY_HANDLER = /\A(?:.* )?(#{NICK})\?{2}.*\Z/

    def self.storage
      @storage ||= Storage.new
    end

    def initialize(base)
      base.add_command(PLUS_HANDLER) do |sender, message|
        matchdata = PLUS_HANDLER.match(message)
        nick      = matchdata[1].to_s
        result    = ::User.new(nick).increment
        if validate(nick, sender)
          "/me | #{sender} zvyšuje karmu uživatele #{nick} na #{result.to_s}"
        else
          cheater(sender)
        end
      end

      base.add_command(MINUS_HANDLER) do |sender, message|
        matchdata = MINUS_HANDLER.match(message)
        nick      = matchdata[1].to_s
        result    = ::User.new(nick).decrement
        if validate(nick, sender)
          "/me | #{sender} snižuje karmu uživatele #{nick} na #{result.to_s}"
        else
          cheater(sender)
        end
      end

      base.add_command(QUERY_HANDLER) do |sender, message|
        matchdata = QUERY_HANDLER.match(message)
        nick      = matchdata[1].to_s
        result    = ::User.new(nick).karma
        "/me | uživatel #{nick} má karmu #{result.to_s}"
      end

      ::User.send :include, Plugins::Karma::User
    end

    def cheater(sender)
      "#{sender}: jestli se budeš snažit měnit vlastní karmu, tak nepůjdeš na oběd!"
    end

    def validate(recipient, sender)
      recipient != sender
    end

    class Storage
      attr_accessor :data

      def initialize
        @file = 'karma_data.yml'
        @data ||= Hash.new { |h, k| h[k] = 0 }
        save_data unless File.exist?(@file) # initialize data file if needed
        load_data
      end

      def karma(user)
        @data[user]
      end

      def add_karma(user, count)
        @data[user] += count
        save_data
        karma(user)
      end

      def remove_karma(user, count)
        @data[user] -= count
        save_data
        karma(user)
      end

      def load_data
        old_data = YAML.load_file(@file)
        old_data.each_pair { |k, v| @data[k] = v }
      end

      def save_data
        File.open(@file, 'w+') do |f|
          f.write YAML.dump(@data)
        end
      end
    end

    module User
      def karma
        Karma.storage.karma(self.safe_name)
      end

      def increment
        Karma.storage.add_karma(self.safe_name, 1)
      end

      def decrement
        Karma.storage.remove_karma(self.safe_name, 1)
      end
    end
  end
end
