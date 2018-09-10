require_relative './ledger/entry'

module FootTraffic
  class Ledger
    def initialize
      @entries = []
    end

    def make_an_entry(room, visitor, activity, log_time)
      if activity == "I"
        entry = Entry.new(room, visitor, in_time: log_time)
        room.login(entry)
        @entries << entry
      elsif activity == "O"
        room.logout(visitor, out_time: log_time)
      end
    end
  end
end
