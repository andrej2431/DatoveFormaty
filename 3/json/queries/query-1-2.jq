[
    ."evidence"[] as $tovarny
    | select($tovarny."typ" == "továrna")
    | {
        "továrna": $tovarny."název".cs,
        "suroviny": [
            ."evidence"[] as $sladkosti
            | select($sladkosti."typ" == "sladkost")
            | ."evidence"[]
            | select(."typ" == "surovina")
            | select(.id | IN($sladkosti | select(.id | IN($tovarny."vyrábí"[])) | .obsahuje[]))
            | ."název".cs
        ] | unique
    }
]
