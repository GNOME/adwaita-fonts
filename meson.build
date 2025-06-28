project(
  'adwaita-fonts',
  version: '49.0',
  license: 'OFL-1.1',
)

datadir = get_option('datadir')

fontsdir = join_paths(datadir, 'fonts', 'Adwaita')

mono = [
  'mono/AdwaitaMono-BoldItalic.ttf',
  'mono/AdwaitaMono-Bold.ttf',
  'mono/AdwaitaMono-Italic.ttf',
  'mono/AdwaitaMono-Regular.ttf',
]

sans = [
  'sans/AdwaitaSans-Italic.ttf',
  'sans/AdwaitaSans-Regular.ttf',
]

install_data(mono + sans, install_dir: fontsdir)
