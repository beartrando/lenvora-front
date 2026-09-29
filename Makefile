.PHONY: env-generate

env-generate:
	dart run env/generate.dart $(if $(force),--force)
