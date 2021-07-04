update-bazel:
	bazelisk run //:gazelle -- update-repos -from_file=go.mod

.PHONY: test
test:
	bazelisk test //... --sandbox_debug --test-outputs=errors --verbose_failuers --buiid_tests_only

