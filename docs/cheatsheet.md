# tmux

## windows

- new: `c`, list: `w`, close: `&`
- previous: `p`, next: `n`

## panes

- new below: `"`, new right: `%`
- nav: `←↓↑→`, cycle: `o`
- swap behind: `{`, swap ahead: `}`
- close: `x`

# nvim

- yank line: `yy`, chg word: `cw`, del char: `x`
- newl below: `o`, above: `O`
- join next line: `J`
- find: `/…`, previous: `N`, next: `n`
- find replace: `:%s/…/…/g`

## utility

- find: ` ff`, grep: ` fg`, open: ` fb`
- browse: ` -`, project: ` cw`
- diagnostics: ` e`, previous: `[d`, next `]d`
- prev: `H`, next: `L`, save + close: ` bd`, discard + close: ` bD`
- docs: `K`, definition: `gd`, implementations: `gi`, references: `gr`
- accept suggestion: `⌃y`, prev: `⌃p`, next: `⌃n`

# yazi

- create: `a`, delete: `d`
- open right: `⌃v`, below: `⌃x`, tab: `⌃t`
- help: `F1`

# fd

- extension: `-e`, hidden/ignored: `-HI`
- file: `-t f`, dir: `-t d`

# ripgrep

- case-insensitive: `-i`, whole word: `-w`, glob: `-g`
- no preview: `-l`

# flakes

- validate: `nix flake check`
- update input: `nix flake update <input>`, apply: `rebuild`
