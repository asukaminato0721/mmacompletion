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
            a1 =
                Check[
                    a1 //
                        KeyValueMap[
                            If[#1 == "Options",
                                ToString[#1, FormatType -> InputForm] <> ": " <> ToString[#2, FormatType -> InputForm]
                                ,
                                ToString[#1, FormatType -> InputForm] <> ": " <> ToString[#2]
                            ]&
                        ]
                    ,
                    $Failed
                ];
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

Names["*"] //
Select[PrintableASCIIQ] //
Select[StringStartsQ[_?UpperCaseQ]] //
AssociationMap[getMapFromName] //
Export["symbols/symbols-all.json", #]&

arr =
    Names["*`*"] //
    Select[StringContainsQ["`"]] //
    Select[
        Function[s,
            StringSplit[s, "`"] // AllTrue[StringStartsQ["$"... ~~ _?UpperCaseQ]]
        ]
    ];

arr //
StringRiffle //
Export["symbols/names.txt", #]&

Function[num,
        arr //
        #[[num ;; num + 500]]& //
        AssociationMap[getMapFromName] //
        Export["symbols/symbols-" <> ToString[num] <> ".json", #]&
    ] // ParallelMap[#, Range[0, 22000, 500]]&
