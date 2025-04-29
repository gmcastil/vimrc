SHELL		:= /bin/bash
PWD		:= $(shell pwd)

.PHONY: setup clean

setup:
# If there is a single file configuration we move it
	@if [[ -f "$(HOME)/.vimrc" ]]; then \
		mv "$(HOME)/.vimrc" "$(HOME)/.vimrc.old"; \
	fi
# If there is an actual configuration directory, we can move that too,
# but if there is a symlink, we remove that
	@if [[ -d "$(HOME)/.vim" ]]; then \
		mv "$(HOME)/.vim" "$(HOME)/.vim.old"; \
	elif [[ -L "$(HOME)/.vim" ]]; then \
		rm -vf "$(HOME)/.vim"; \
	fi
# Now we can set this up properly
	@ln -svf "$(PWD)" "$(HOME)/.vim" && \
	git reset --hard && \
	git clean -dfx && \
	./setup

clean:
	@if [[ -L "$(HOME)/.vim" ]]; then \
		rm "$(HOME)/.vim"; \
	fi
	@rm -rf pack && git clean -dfx
