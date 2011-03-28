module StudioMobile
  class Hooks < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context)
      stylesheet_link_tag 'studiomobile_tweaks', :plugin => :redmine_studiomobile_tweaks
    end
  end
end