# Project name, programming language and version
project (
    'com.github.max246.powerbuddy',
    'vala', 'c',
    version: '0.0.2'
)

# Translation module
i18n = import ('i18n')

# Project arguments
add_project_arguments (
    '-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name ()),
    language: 'c'
)


gnome = import('gnome')

asresources = gnome.compile_resources(
    'as-resources', 'data/css.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

# Listing dependencies
dependencies = [
    dependency ('glib-2.0'),
    dependency ('gtk+-3.0'),
    dependency ('gee-0.8'),
    dependency ('granite'),
    dependency ('json-glib-1.0'),
   # dependency ('libupower-glib-dev'),
]

subdir ('src')

# Executable
executable (
    meson.project_name (),
    sources,
    asresources,
    dependencies: dependencies,
    install: true
)

subdir ('data')
subdir ('po')

meson.add_install_script('build-aux/meson/postinstall.py')
