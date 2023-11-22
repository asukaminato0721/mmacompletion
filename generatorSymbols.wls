Names["*`*"] // Select[StringContainsQ["`"]] //
(* Select[
    Function[s,
        StringSplit[s, "`"] // AllTrue[StringStartsQ["$"... ~~ _?UpperCaseQ
            ]]
    ]
] // *)
StringRiffle[#, "\n"]& //
Export["./symbols.txt", #]&

(* nake =
    (
        Unprotect[#];
        ClearAttributes[#, ReadProtected];
        #
    )&;

Developer`ToJSON //
nake //
Information //
First //
KeyValueMap[ToString[#1] -> ToString[#2]&] //
ExportString[#, "JSON"]& //
Print *)