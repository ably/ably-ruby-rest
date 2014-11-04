module Ably
  module Models
    class Message
      # REST library does not depend on EventMachine::Deferrable, empty module will be used instead
      module EventMachine
        module Deferrable
        end
      end
    end
  end
end

module Ably
  module Models
    class PresenceMessage
      # REST library does not depend on EventMachine::Deferrable, empty module will be used instead
      module EventMachine
        module Deferrable
        end
      end
    end
  end
end
