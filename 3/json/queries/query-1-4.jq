."evidence"[] as $sladkost1
| select($sladkost1."typ" == "sladkost")
| ."evidence"[] as $sladkost2
| select($sladkost2."typ" == "sladkost")
| select($sladkost1."id" < $sladkost2."id")
| [
    $sladkost1."název"."cs", $sladkost2."název"."cs",
    [
        ."evidence"[] as $alergen
        | select($alergen."typ" == "alergen")
        | ."evidence"[] as $surovina1
        | select($surovina1."typ" == "surovina")
        | select($surovina1."obsahuje" != null)
        | select($sladkost1."obsahuje"[] | index($surovina1."id"))
        | select($surovina1."obsahuje"[] | index($alergen."id"))
        | ."evidence"[] as $surovina2
        | select($surovina2."typ" == "surovina")
        | select($surovina2."obsahuje" != null)
        | select($sladkost2."obsahuje"[] | index($surovina2."id"))
        | select($surovina2."obsahuje"[] | index($alergen."id"))
        | $alergen
    ] as $alergeny
    | ([$alergeny[]."název"."cs"] | unique)
]
