module Styx
  class Watcher
    def initialize(target)
      target.add_observer(self)
    end

    def update(entry)
      fail 'implement in inheriting class'
    end
  end
end
