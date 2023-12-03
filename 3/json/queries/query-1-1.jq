."továrny"[] as $tovarny |
{
    "továrna": $tovarny."název".cs,
    "kapacita automatů": [.automaty[] | select(."nachází se v" == $tovarny.id) | .kapacita] | add
}
