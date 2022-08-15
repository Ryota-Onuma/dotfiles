.PHONY: update
update:
   @docker build . -t oryota/neovim:latest --no-cache
   @docker push oryota/neovim:latest
