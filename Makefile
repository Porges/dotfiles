# based upon github.com/sanpii/my-dotfiles

dotfiles = $(filter-out README.md Makefile gnome-terminal-colors-solarized dircolors-solarized solarized base16-monokai-dark.sh, $(wildcard *))

home-dotfiles = $(addprefix $(HOME)/.,$(dotfiles)) install-terminal-theme

.PHONY: install-terminal-theme

install: $(home-dotfiles)

install-terminal-theme:
	./base16-monokai-dark.sh

$(HOME)/.%: %
	[ ! -e $@ -o -L $@ ]
	$(RM) $@
	ln -s $(CURDIR)/$* $@

$(HOME)/.Xresources: solarized/xresources/solarized
	[ ! -e $@ -o -L $@ ]
	$(RM) $@
	ln -s $(CURDIR)/$^ $@

uninstall: $(addsuffix __unlink, $(home-dotfiles))
%__unlink:
	[ -L $* ] && $(RM) $*
