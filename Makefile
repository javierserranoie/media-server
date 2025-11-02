.DEFAULT_GOAL := help
.PHONY: help
help:
	@echo "Makefile commands:"
	@echo "  make start      - Start the k3s Kubernetes cluster"
	@echo "  make stop       - Stop the k3s Kubernetes cluster"
	@echo "  make apply      - Apply the media stack Kubernetes manifests"
	@echo "  make delete     - Delete the media stack Kubernetes manifests"				
	@echo "  make prepare    - Prepare local directories for persistent volumes"
	@echo "  make clean      - Clean up local directories for persistent volumes"

.PHONY: start
start:
	@docker start registry 
	@sudo systemctl start k3s

.PHONY: stop
stop:
	@sudo systemctl stop k3s*
	@docker stop registry

.PHONY: apply
apply:
	@envsubst < media-stack.yaml | kubectl apply -f -

.PHONY: delete
delete:
	@envsubst < media-stack.yaml | kubectl delete -f -

.PHONY: prepare
prepare:
	@mkdir -p media/pv/tv \
		media/pv/movies \
		media/pv/books \
		media/pv/audiobooks \
		media/pv/music \
		media/pv/downloads \
		media/sv/emby \
		media/sv/bazarr \
		media/sv/lidarr \
		media/sv/jellyseerr \
		media/sv/prowlarr \
		media/sv/qbittorrent \
		media/sv/radarr \
		media/sv/sabnzbd \
		media/sv/sonarr \
		media/sv/lazylibrarian

.PHONY: clean
clean:
	@rm -rf media/pv/tv \
		media/pv/movies \
		media/pv/books \
		media/pv/audiobooks \
		media/pv/music \
		media/pv/downloads \
		media/sv/emby \
		media/sv/bazarr \
		media/sv/lidarr \
		media/sv/jellyseerr \
		media/sv/prowlarr \
		media/sv/qbittorrent/config \
		media/sv/radarr \
		media/sv/sabnzbd/config \
		media/sv/sonarr \
		media/sv/lazylibrarian