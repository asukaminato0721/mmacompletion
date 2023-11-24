nake =
    (
        Unprotect[#];
        ClearAttributes[#, ReadProtected];
        #
    )&;

getMapFromName[x_String](* String *) :=
    Block[{},
        TimeConstrained[
            a1 = Check[x // Symbol, $Failed];
            If[a1 === $Failed,
                Return["None"]
            ];
            a1 = Check[a1 // nake, $Failed];
            If[a1 === $Failed,
                Return["None"]
            ];
            a1 = Check[a1 // Information, $Failed];
            If[a1 === $Failed,
                Return["None"]
            ];
            a1 = Check[a1 // First, $Failed];
            If[a1 === $Failed,
                Return["None"]
            ];
            a1 = Check[a1 // KeyValueMap[ToString[#1] <> ": " <> ToString[
                #2]&], $Failed];
            If[a1 === $Failed,
                Return["None"]
            ];
            a1 = Check[a1 // StringRiffle[#, "\n"]&, $Failed];
            If[a1 === $Failed,
                Return["None"]
            ];
            a1
            ,
            2
            ,
            "None"
        ]
    ]

skipFunctions = WolframLanguageData["EntityCanonicalNames"] // AssociationMap[
    True&]

arr =
    Names["*`*"] //
    Select[!KeyExistsQ[skipFunctions, #]&] //
    Select[
        Function[s,
            StringSplit[s, "`"] // AllTrue[StringStartsQ["$"... ~~ _?
                UpperCaseQ]]
        ]
    ];

arr //
StringRiffle //
Export["symbols/names.txt", #]&

(* arr // #[[;;500]]&//
AssociationMap[getMapFromName] //
Export["symbols-500.json", #]&;
arr // #[[501;;1000]]&//
AssociationMap[getMapFromName] //
Export["symbols.json", #]& *)

Function[num,
        arr //
        #[[num ;; num + 500]]& //
        AssociationMap[getMapFromName] //
        Export["symbols/symbols-" <> ToString[num] <> ".json", #]&
    ] // ParallelMap[#, Range[0, 22000, 500]]&
