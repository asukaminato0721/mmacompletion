# mmacompletion

complete more functions for mathematica

It can provide undocumented function completion for mathematica.

---

## Development

Get all inner functions. Make sure you have `wolframscript` in your `PATH`.

```
wolframscript -f ./generatorSymbols.wls
```

then

<kbd>F5</kbd>

## Build

```sh
vsce package
```

No `node_modules`

---

## TODO

use

```mma
nake = (Unprotect[#];ClearAttributes[#, ReadProtected];#)&
PaneSelectorBox // nake // Information
```

to get some documents.
