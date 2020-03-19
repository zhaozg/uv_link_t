all:	build
	ninja -C build

build:
	meson build

clean:
	rm -rf build

test: dist
	./out/Release/uv_link_t-test

example: dist
	./out/Release/uv_link_t-example

dist:
	gypkg build uv_link_t.gyp

.PHONY: test example dist
