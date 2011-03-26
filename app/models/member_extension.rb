module MemberExtension

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable

      before_destroy :remove_watcher
      after_create :add_watcher
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def add_watcher
      if Setting.plugin_studiomobile_tweaks['watch_forum_messages']
        project.boards.each {|b| b.set_watcher(user, true) } if user
      end
    end

    def remove_watcher
      if Setting.plugin_studiomobile_tweaks['watch_forum_messages']
        project.boards.each {|b| b.set_watcher(user, false) } if user
      end
    end
  end

end