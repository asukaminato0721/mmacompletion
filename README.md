# mmacompletion

complete more functions for mathematica, and more informations

this is the completion for `Plus`

```mma
"ObjectType": Symbol
"Usage": x + y + z represents a sum of terms. 
"Documentation": None
"OwnValues": None
"UpValues": None
"DownValues": None
"SubValues": None
"DefaultValues": Default[Plus] := 0
"NValues": None
"FormatValues": None
"Options": None
"Attributes": {Flat, Listable, NumericFunction, OneIdentity, Orderless}
"FullName": System`Plus
```

for `Plot`, all Options can be seem easily. "Usage" is messy now though.

```mma
"ObjectType": Symbol
"Usage": Plot[f, {x, x   , x   }] generates a plot of f as a function of x from x    to x   . Plot[{f , f , …}, {x, x   , x   }] plots several functions f . Plot[{…, w[f ], …}, …] plots f  with features defined by the symbolic wrapper w.Plot[…, {x} ∈ reg] takes the variable x to be in the geometric region reg.
             min   max                                                  min     max         1   2           min   max                            i              i                 i
"Documentation": None
"OwnValues": None
"UpValues": None
"DownValues": (Plot[System`SampledPlotsDump`a:PatternSequence[___, Except[_?System`Dump`HeldOptionQ]] | PatternSequence[], System`SampledPlotsDump`o:OptionsPattern[]])?(Function[System`SampledPlotsDump`arg, Charting`PlotArgCheck[System`SampledPlotsDump`arg, System`SampledPlotsDump`iPlot, 2], HoldFirst]) := With[{System`SampledPlotsDump`res = Catch[System`SampledPlotsDump`iPlotLayer1[Plot, System`SampledPlotsDump`a, System`SampledPlotsDump`o], "ParseNoData" | "ChartingError", $Failed]}, System`SampledPlotsDump`res /; Head[Unevaluated[System`SampledPlotsDump`res]] =!= $Failed]
"SubValues": None
"DefaultValues": None
"NValues": None
"FormatValues": None
"Options": {AlignmentPoint -> Center, AspectRatio -> GoldenRatio^(-1), Axes -> True, AxesLabel -> None, AxesOrigin -> Automatic, AxesStyle -> {}, Background -> None, BaselinePosition -> Automatic, BaseStyle -> {}, ClippingStyle -> None, ColorFunction -> Automatic, ColorFunctionScaling -> True, ColorOutput -> Automatic, ContentSelectable -> Automatic, CoordinatesToolOptions -> Automatic, DisplayFunction :> $DisplayFunction, Epilog -> {}, Evaluated -> Automatic, EvaluationMonitor -> None, Exclusions -> Automatic, ExclusionsStyle -> None, Filling -> None, FillingStyle -> Automatic, FormatType :> TraditionalForm, Frame -> False, FrameLabel -> None, FrameStyle -> {}, FrameTicks -> Automatic, FrameTicksStyle -> {}, GridLines -> None, GridLinesStyle -> {}, ImageMargins -> 0., ImagePadding -> All, ImageSize -> Automatic, ImageSizeRaw -> Automatic, LabelingSize -> Automatic, LabelStyle -> {}, MaxRecursion -> Automatic, Mesh -> None, MeshFunctions -> {#1 & }, MeshShading -> None, MeshStyle -> Automatic, Method -> Automatic, PerformanceGoal :> $PerformanceGoal, PlotLabel -> None, PlotLabels -> None, PlotLegends -> None, PlotPoints -> Automatic, PlotRange -> {Full, Automatic}, PlotRangeClipping -> True, PlotRangePadding -> Automatic, PlotRegion -> Automatic, PlotStyle -> Automatic, PlotTheme :> $PlotTheme, PreserveImageOptions -> Automatic, Prolog -> {}, RegionFunction -> (True & ), RotateLabel -> True, ScalingFunctions -> None, TargetUnits -> Automatic, Ticks -> Automatic, TicksStyle -> {}, WorkingPrecision -> MachinePrecision}
"Attributes": {HoldAll}
"FullName": System`Plot
```

and convenient undocumented functions completions, for example, the ``` FEM` ``` package.

![FEM](https://i.imgur.com/kwmIkZ1.png)

## Install

<https://code.visualstudio.com/docs/editor/extension-marketplace#_install-from-a-vsix>

you can get vsix from [release](https://github.com/asukaminato0721/mmacompletion/releases)

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
