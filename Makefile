# Makefile

# Commands
SUSHI_CMD = sushi
LOCAL_CANONICAL = http://localhost:8080/fhir

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build            - Build with local canonical (no publishing)."
	@echo "  make publish-local    - Build and publish to Local HAPI FHIR instance."
	@echo "  make ig               - Build locally and generate the FHIR IG(s)."
	@echo "  make all              - Build, validate, and (optionally) publish (local only)."

.PHONY: build
build:
	@echo "Replacing default canonical with local canonical: $(LOCAL_CANONICAL)"
	sed -i.bak "s|https://nshr.dha.go.ke/fhir|$(LOCAL_CANONICAL)|g" sushi-config.yaml
	$(SUSHI_CMD) .
	@echo "Local SUSHI build complete. Canonical set to $(LOCAL_CANONICAL)."
	sed -i.bak "s|$(LOCAL_CANONICAL)|https://nshr.dha.go.ke/fhir|g" sushi-config.yaml
	rm -f sushi-config.yaml.bak

.PHONY: ig
ig:
	@echo "Generating FHIR Implementation Guide(s)..."
	./_updatePublisher.sh
	./_genonce.sh
	@echo "FHIR IG generation complete."

.PHONY: publish-local
publish-local:
	@echo "Replacing default canonical with local canonical: $(LOCAL_CANONICAL)"
	sed -i.bak "s|https://nshr.dha.go.ke/fhir|$(LOCAL_CANONICAL)|g" sushi-config.yaml
	$(SUSHI_CMD) .
	@echo "Publishing to Local HAPI FHIR at $(LOCAL_CANONICAL)"
	@AUTH_OPT=""; \
	if [ -n "$$HAPI_USERNAME" ] && [ -n "$$HAPI_PASSWORD" ]; then \
	  AUTH_OPT="-u $$HAPI_USERNAME:$$HAPI_PASSWORD"; \
	  echo "Using HTTP basic auth with provided credentials"; \
	fi; \
	for file in fsh-generated/resources/*.json; do \
	  if [ -f "$$file" ]; then \
	    RESOURCE_TYPE=$$(jq -r '.resourceType' "$$file"); \
	    RESOURCE_ID=$$(jq -r '.id' "$$file"); \
	    if [ "$$RESOURCE_TYPE" = "StructureDefinition" ] || \
	       [ "$$RESOURCE_TYPE" = "ValueSet" ] || \
	       [ "$$RESOURCE_TYPE" = "CodeSystem" ]; then \
	      echo "Uploading $$file (Type: $$RESOURCE_TYPE, ID: $$RESOURCE_ID)"; \
	      STATUS_CODE=$$(curl -s -o /dev/null -w "%{http_code}" \
	        $$AUTH_OPT \
	        -X PUT "$(LOCAL_CANONICAL)/$$RESOURCE_TYPE/$$RESOURCE_ID" \
	        -H "Content-Type: application/fhir+json" \
	        --data-binary "@$$file"); \
	      if [ "$$STATUS_CODE" -lt 200 ] || [ "$$STATUS_CODE" -ge 300 ]; then \
	        echo "Error uploading $$file to $(LOCAL_CANONICAL) (HTTP $$STATUS_CODE)"; \
	        exit 1; \
	      fi; \
	    else \
	      echo "Skipping $$file: $$RESOURCE_TYPE is not a conformance resource."; \
	    fi; \
	  fi; \
	done
	rm -f sushi-config.yaml.bak
	@echo "Local publish complete."

.PHONY: all
all: build ig publish-local
	@echo "Local build and validation complete. Not publishing to remote FHIR servers."
