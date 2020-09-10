sources = [
  'src/main.vala',
  'src/window.vala',
  'src/Pages/BatteryPage.vala',
  'src/Pages/HistoryPage.vala',
  'src/Pages/StatsPage.vala',
  'src/Pages/ACPage.vala',
  'src/Pages/DevicePage.vala',
  'src/Views/BatteryView.vala',

]


powerbuddy_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

sources += gnome.compile_resources('powerbuddy-resources',
  'powerbuddy.gresource.xml',
  c_name: 'powerbuddy'
)

#executable('powerbuddy', sources,
#  vala_args: '--target-glib=2.50',  dependencies: powerbuddy_deps,
#  install: true,
#)
