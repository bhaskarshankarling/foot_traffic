module FootTraffic
  class Visitor
    attr_accessor :id

    def initialize(id)
      @id = id
    end

    def logout
      @current_room = nil
    end

    def visit(room)
      @current_room = room
    end

    def not_in_other_room?
      @current_room == nil
    end

    def is_in_room(room)
      @current_room != nil && @current_room.id == room.id
    end
  end
end
