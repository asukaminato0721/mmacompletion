# mmacompletion

complete more functions for mathematica

It can provide undocumented function completion for mathematica.

---

## Development

Get all inner functions. Make sure you have `wolframscript` in your `PATH`.

```
wolframscript -f ./generatorSymbols.wls
```

There may throw a lot of errors, so be patient.

then

<kbd>F5</kbd>

## Build

```sh
vsce package
```

No `node_modules`

---

## Warning:

Undocumented functions may change from version to version, so better generate the version you use.
