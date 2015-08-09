module Timmy
  module Helpers

    module Enableable

      def enable!; self.update(enabled: true); end
      def disable!; self.update(enabled: false); end
      def disabled?; self.enabled == false; end
      def enabled?; not disabled?; end

    end


    module Activatable

      def active!; self.update(active: true); end
      def inactive!; self.update(active: false); end
      def active?; self.active == true; end
      def inactive?; not active?; end
    end

  end
end
