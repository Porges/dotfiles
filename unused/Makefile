dotfiles = $(wildcard home/*)

home-dotfiles = $(addprefix $(HOME)/.,$(dotfiles))

install: $(home-dotfiles)

$(HOME)/.%: %
	[ ! -e $@ -o -L $@ ]
	$(RM) $@
	ln -s $(CURDIR)/$* $@

uninstall: $(addsuffix __unlink, $(home-dotfiles))
%__unlink:
	[ -L $* ] && $(RM) $*
