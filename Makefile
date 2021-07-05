update-bazel:
	bazelisk run //:gazelle -- update-repos -from_file=go.mod

.PHONY: test
test:
	bazelisk test //... --sandbox_debug --test_output=errors --verbose_failures --build_tests_only

