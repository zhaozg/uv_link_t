project('uv_link', ['c'], version: '1.0.5')

c = meson.get_compiler('c')
uv_dep = dependency('libuv', version: '>=1.0.0', required: false)
if not uv_dep.found()
  error('use_libuv option was set to true, but libuv was not found.')
endif

uv_link_dir = include_directories('include')
uv_link_lib = static_library('uv_link',
  sources: [
    'src/defaults.c',
    'src/uv_link_t.c',
    'src/uv_link_observer_t.c',
    'src/uv_link_source_t.c',
  ],
  dependencies : [uv_dep],
  include_directories: [uv_link_dir])

e = executable('uv_link_example',
  sources: [
    'example/src/main.c',
    'example/src/middle.c'
  ],
  link_with: [uv_link_lib ],
  dependencies : [uv_dep],
  include_directories: [uv_link_dir])

ts = [
  'test/src/test-defaults.c',
  'test/src/test-uv-link-source-t.c',
  'test/src/test-list.h',
  'test/src/test-common.h',
  'test/src/test-strerror.c',
  'test/src/main.c',
  'test/src/test-close.c',
  'test/src/test-uv-link-observer-t.c'
  ]

if host_machine.system() == 'Windows'
  ts += [ '../mini-test/src/spawn-win.c' ]
else
  ts += [ '../mini-test/src/spawn-unix.c' ]
endif

t = executable('uv_link_test',
  sources: ts,
  link_with: [uv_link_lib],
  dependencies : [uv_dep],
  include_directories: [uv_link_dir, '../mini-test/include'])

test('uv_link_t test', t)

