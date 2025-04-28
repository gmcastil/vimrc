SHELL		:= /bin/bash
PWD		:= $(shell pwd)

.PHONY: setup clean

setup:
	@if [[ -f "${HOME}/.vimrc" ]]; then \
		rm -fv "${HOME}/.vimrc"; \
	fi
	@if [[ ! -d "${HOME}/.vim" ]]; then \
		ln -svf "$(PWD)" "$(HOME)/.vim"; \
	fi
	@git reset --hard && git clean -dfx
	@./setup && ln -svf "$(PWD)" "$(HOME)/.vim"

clean:
	@if [[ -L "${HOME}/.vim" ]]; then \
		rm "${HOME}/.vim"; \
	fi
	rm -rf pack
	git clean -dfx

