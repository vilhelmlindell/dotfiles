local colors = {
  black        = '#1e1e2e',
  white        = '#cdd6f4',
  red          = '#f38ba8',
  green        = '#a6e3a1',
  blue         = '#89b4fa',
  yellow       = '#f9e2af',
  gray         = '#313244',
  darkgray     = '#313244',
  lightgray    = '#313244',
  inactivegray = '#313244',
}
return {
  normal = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.gray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.gray},
    c = {bg = colors.gray, fg = colors.gray}
  }
}
