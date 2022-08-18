.PHONY: update
update:
	docker image build . -t oryota/neovim:latest --no-cache && docker push oryota/neovim:latest

