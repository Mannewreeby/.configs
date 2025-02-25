
-- Setup org-mode
require('orgmode').setup({
  org_agenda_files = {'~/org/*'},
  org_default_notes_file = '~/org/notes.org',
  org_todo_keywords = {'TODO', 'DOING', 'BLOCKED', 'DONE'},
  org_agenda_templates = {
    T = {
      description = 'Todo',
      template = '* TODO %?\n  %U\n  %a',
    },
    D = {
      description = 'Deadline',
      template = '* TODO %?\n  DEADLINE: %t',
    },
    E = {
      description = 'Event',
      template = '* %?\n  %U',
    },
  },
})
