module FootTraffic
  class Room
    attr_accessor :id

    def initialize(id)
      @id = id
      @visitors = Hash.new()
      @total_minutes = 0
      @total_visitors = 0
    end

    def login(entry)
      if valid_login_entry?(entry)
        if @visitors[entry.visitor.id] != nil
          @visitors[entry.visitor.id] << entry
        else
          @visitors[entry.visitor.id] = [entry]
        end
        entry.visitor.visit(self)
        @total_visitors += 1
      else
        raise "Invalid login entry"
      end
    end

    def logout(visitor, out_time:)
      if valid_logout_entry?(visitor)
        last_visitor_entry = @visitors[visitor.id].last
        last_visitor_entry.logout(out_time)
        @total_minutes += last_visitor_entry.time_spent
      else
        raise "Invalid logout entry"
      end
    end

    def average_time_spent_by_visitors
      (@total_minutes.to_f / @total_visitors.to_f).floor
    end

    def num_of_visitors
      return "#{@total_visitors} visitors" if @total_visitors > 1
      "#{@total_visitors} visitor"
    end

    private

    def valid_logout_entry?(visitor)
      return false if @visitors[visitor.id] == nil
      last_visitor_entry = @visitors[visitor.id].last
      last_visitor_entry.logged_in? && visitor.is_in_room(self)
    end

    def valid_login_entry?(entry)
      return true if @visitors[entry.visitor.id] == nil
      last_visitor_entry = @visitors[entry.visitor.id].last
      last_visitor_entry.logged_out? && entry.visitor.not_in_other_room?
    end
  end
end
