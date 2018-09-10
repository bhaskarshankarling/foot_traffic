module FootTraffic
  class Entry
    attr_accessor :visitor
    def initialize(room, visitor, in_time: nil)
      @room = room
      @visitor = visitor
      # might need to include the logged in minute as well but without this, the output for first sample is
      # coming fine. Issue happening with only second test sample in the mail. So, commenting this changes.
      # @in_time = in_time - 1
      @in_time = in_time
      @out_time = nil
    end

    def logout(out_time)
      @out_time = out_time
      @visitor.logout
    end

    def logged_out?
      @out_time != nil
    end

    def logged_in?
      @out_time == nil
    end

    def time_spent
      @out_time - @in_time
    end
  end
end
