module StudioMobile
  class IssuesControllerHooks < Redmine::Hook::Listener

    def controller_issues_edit_before_save(context)
      issue = context[:issue]
      journal = context[:journal]

      add_to_watchers_after_comment(issue, journal)
    end

private

    def add_to_watchers_after_comment(issue, journal)
      if Setting.plugin_studiomobile_tweaks['add_to_watchers_after_comment_issue']
        author = issue.author
        user = journal.user

        issue.add_watcher(user) if author.id != user.id && !journal.notes.empty? && !issue.watched_by?(user)
      end
    end

  end
end