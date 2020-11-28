SKAFFOLD_VERSION := 1.17.0

SKAFFOLD := $(CACHE_VERSIONS)/skaffold/$(SKAFFOLD_VERSION)
$(SKAFFOLD):
	@rm -f $(CACHE_BIN)/skaffold
	@mkdir -p $(CACHE_BIN)

	curl -sSL \
	  "https://storage.googleapis.com/skaffold/releases/v$(SKAFFOLD_VERSION)/skaffold-$(UNAME_OS)-$(UNAME_ARCH)" \
		-o "$(CACHE_BIN)/skaffold"
	chmod +x "$(CACHE_BIN)/skaffold"

	@rm -rf $(dir $(SKAFFOLD))
	@mkdir -p $(dir $(SKAFFOLD))
	@touch $(SKAFFOLD)

dev: $(SKAFFOLD)
	skaffold version