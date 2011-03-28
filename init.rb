require 'redmine'

require_dependency 'studiomobile/hooks'

# Patches to the Redmine core.
require 'dispatcher'

Dispatcher.to_prepare do

  require_dependency 'member'

  Member.send :include, MemberExtension

end

Redmine::Plugin.register :studiomobile_tweaks do
  name 'Redmine Studiomobile Tweaks plugin'
  author 'Maxim Dobryakov'
  description 'Redmine Tweaks'
  version '0.0.1'
  url 'http://github.com/maxd/redmine_studiomobile_tweaks'
  author_url 'http://maxd.info'

  settings :default => {'group_name' => 'StudioMobile', 'manager_role' => 'Manager'}, :partial => 'settings/tweaks'
end