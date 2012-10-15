# based upon github.com/sanpii/my-dotfiles

dotfiles = $(filter-out README.md Makefile gnome-terminal-colors-solarized dircolors-solarized solarized, $(wildcard *))

home-dotfiles = $(addprefix $(HOME)/.,$(dotfiles))

.PHONY: install-solarized-theme

install: $(home-dotfiles) $(HOME)/.Xresources install-solarized-theme

install-solarized-theme:
	gnome-terminal-colors-solarized/set_dark.sh

$(HOME)/.%: %
	[ ! -e $@ -o -L $@ ]
	$(RM) $@
	ln -s $(CURDIR)/$* $@

$(HOME)/.Xresources: solarized/xresources-colors-solarized/Xresources
	[ ! -e $@ -o -L $@ ]
	$(RM) $@
	ln -s $(CURDIR)/$^ $@

uninstall: $(addsuffix __unlink, $(home-dotfiles))
%__unlink:
	[ -L $* ] && $(RM) $*
