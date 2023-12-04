[
    ."evidence"[] as $tovarny
    | select($tovarny."typ" == "továrna") |
    {
        "továrna": $tovarny."název"."cs",
        "kapacita automatů": [."evidence"[] | select(."typ" == "automat") | select(."nachází se v" == $tovarny.id) | .kapacita] | add
    }
]
