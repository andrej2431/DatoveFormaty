."evidence"[] as $sladkost
| select($sladkost.typ == "sladkost")
| select(
    [."evidence"[] as $automat
    | select($automat.typ == "automat")
    | select(
        [."evidence"[] as $tovarna
        | select($tovarna.typ == "továrna")
        | select($tovarna."zaměstnává"[] | ."jméno"."cs" | any(index("Artemis")))
        | $tovarna."id"] | any(index($automat."nachází se v"))
    ) | $automat."nabízí"[]
    ] | unique as $sladkostid
    | $sladkostid | any(index($sladkost."id"))
) | select(
    $sladkost."obsahuje" | index("ex:Čokoláda") == null
) | $sladkost."název"."cs"
