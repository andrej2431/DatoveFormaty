[
    ."továrny"[] as $tovarny |
    {
        "továrna": $tovarny."název".cs,
        "suroviny": [
            .sladkosti[] as $sladkosti |
            .suroviny[] |
            select(.id | IN($sladkosti | select(.id | IN($tovarny."vyrábí"[])) | .obsahuje[])) |
            ."název".cs
        ]
    }
]
