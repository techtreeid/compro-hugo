run-upbusinesstheme:
	hugo server --config config-upbusinesstheme.toml
build-upbusinesstheme:
	hugo --config config-upbusinesstheme.toml
deploy-upbusinesstheme: build-upbusinesstheme
	./deploy.sh upbusinesstheme