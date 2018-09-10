require_relative './foot_traffic/ledger'
require_relative './foot_traffic/visitor'
require_relative './foot_traffic/room'

module FootTraffic
  class Museum
    def initialize
      @rooms = []
      @visitors = {}
      @ledger = Ledger.new
    end

    def take_visitor_details
      puts "Provide the input:"
      number_of_entries = gets.strip.to_i
      number_of_entries.times do
        visitor_id, room_id, activity, log_time = gets.strip.split(" ")
        room = fetch_or_create_room(room_id.to_i)
        visitor = fetch_or_create_visitor(visitor_id.to_i)
        @ledger.make_an_entry(room, visitor, activity, log_time.to_i)
      end
    end

    def stats_of_visitors_by_room
      puts "\nBelow is the analysis"
      puts "---------------------"
      @rooms.compact.each do |room|
        puts "Room #{room.id}, #{room.average_time_spent_by_visitors} minute average visit, #{room.num_of_visitors} total"
      end
    end

    private

    def fetch_or_create_visitor(visitor_id)
      @visitors[visitor_id] ||= Visitor.new(visitor_id)
    end

    def fetch_or_create_room(room_id)
      @rooms[room_id] ||= Room.new(room_id)
    end
  end
end
