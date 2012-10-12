# based upon github.com/sanpii/my-dotfiles

dotfiles = $(filter-out README.md Makefile, $(wildcard *))

home-dotfiles = $(addprefix $(HOME)/.,$(dotfiles))

install: $(home-dotfiles)

$(HOME)/.%: %
	[ ! -e $@ -o -L $@ ]
	$(RM) $@
	ln -s $(CURDIR)/$* $@


uninstall: $(addsuffix __unlink, $(home-dotfiles))
%__unlink:
	[ -L $* ] && $(RM) $*
