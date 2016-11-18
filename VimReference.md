# Vim command reference

With *n* plugins installed, there are a lot of things to remember. So let’s put
them all here…

If there is a built-in command that’s overridden with a better version by
a plugin, then it’s listed in the plugin.

## Insert mode

### [supertab][]

`<tab>`: complete all the things

### [vim-lexical][]

`Ctrl-X Ctrl-S`: suggest word (or use [supertab][] instead)

`Ctrl-X Ctrl-T`: suggest word from thesaurus

## Normal mode

### [vim-sensible][]

`Ctrl-L`: clear search highlighting

### [vim-unimpaired][]

`]q`/`[q`/`[Q`/`]Q`: next/previous/first/last item in quickfix list

`]b`/`[b`/`[B`/`]B`: next/previous/first/last buffer

`]l`/`[l`/`[L`/`]L`: next/previous/first/last item in location list

`]f`/`[f`: next/previous file in current directory

`]n`/`[n`: next/previous conflict or diff

`[ `/`] `: add blank lines before/after cursor

`[e`/`]e`: exchange line with previous/next line

`[x`/`]x`: XML encode/decode (with motion, also in Visual mode)

`[xx`/`]xx`: XML encode/decode line

`[u`/`]u`: URI encode/decode (with, motion, also in Visual mode)

`[uu`/`]uu`: URI encode/decode line

`[y`/`]y`: C-string encode/decode (with motion, also in Visual mode)

`[yy`/`]yy`: C-string encode/decode line

### [vim-lexical][]

`]s`: next misspelled word

`[s`: previous misspelled word

`]S`: next bad word (bad is not just rare)

`[S`: previous bad word

`zg`: mark **g**ood

`zw`: mark **w**rong

`zug`: **u**nmark **g**ood

`zuw`: **u**nmark **w**rong

`z=`: show suggestions

`1z=`: use first suggestion

### [vim-surround][]

`ysTX`: **y**ou **s**urround text object *T* with *X*

`yssX`: **y**ou **s**urround current line with *X*

`csXY`: **c**hange **s**urrounding *X* to *Y*

`dsX`: **d**elete **s**urrounding *X*

*X* (or *Y*) can be one of:

* `(` or `)` or `b`: parentheses
* `{` or `}` or `B`: braces
* `[` or `]` or `r`: brackets
* `<` or `>` or `a`: angle brackets
* `'`: single quotes
* `"`: double quotes
* `````: backticks
* `q`: curly quotes (provided by vim-textobj-sentence)
* `Q`: curly single quotes (provided by vim-textobj-sentence)
* `t`: any HTML tag
* `<tag>`: specific HTML tag

###

## Motions

### Vim defaults

### [vim-textobj-sentence][]

`(`/`)`: start of previous/next sentence
`g(`/g`)`: end of previous/current sentence

## Text objects

All of these generally work with `i` (inside) or `a` (around). Unless explicitly
called out, this includes the delimiters.

### Vim defaults

`w`: word

### [targets.vim][]

Targets.vim extends a lot of built-in objects to work more consistently. For
example, you can say `ci(` while outside the parentheses and it will change the
next occurence. Alternately you can prefix with a number (`2ci(`) to change the
outer pair of parentheses, when nested.

These accept `i` (inside), `a` (around), `I` (inside except whitespace), or `A`
(around with whitespace). You can also suffix the prefix with `n` (next) or
`l` (last).

`(` or `)` or `b`: parentheses

`{` or `}` or `B`: brackets

`[` or `]`: square brackets

`<` or `>`: angle brackets

`t`: tag

`a`: argument

``,.;:+-=~_*#/|\&$``: delimters; e.g. `da,` deletes an item in a comma-separated list.

### [vim-textobj-entire][]

`ae`: entire file

`ie`: entire file except leading/trailing blank lines

### [vim-textobj-quote][]

`q`: double quotes

`Q`: single quotes

### [vim-textobj-sentence][]

`s`: sentence

### [targets.vim][]

Asd

## Visual mode

asd

[supertab]: https://github.com/ervandew/supertab
[vim-unimpaired]: https://github.com/tpope/vim-unimpaired
[vim-surround]: https://github.com/tpope/vim-surround
[vim-lexical]: https://github.com/reedes/vim-lexical
[vim-textobj-entire]: https://github.com/kana/vim-textobj-entire
[vim-textobj-quote]: https://gitub.com/reedes/vim-textobj-quote
[vim-textobj-sentence]: https://github.com/reedes/vim-textobj-sentence
[vim-sensible]: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
[targets.vim]: https://github.com/wellle/targets.vim
