.PHONY: update
update:
	docker image build ./nvim -f nvim/Dockerfile -t oryota/neovim:latest --no-cache && docker push oryota/neovim:latest

