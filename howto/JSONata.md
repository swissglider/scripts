# JSONata samples

[JSONata Test Umgebung](http://try.jsonata.org/)  
[JSONata Dokumentation](http://docs.jsonata.org/overview)

```
{'price': $average(Account.Order[*].Product[*].Price) & ' CHF'}

{'price': $average(Account.Order[*].Product[*][Description.Colour='Purple'].Price) & ' CHF'}

{'members': Account.Order[*].Product[*].Description.Colour}

Account.Order.Product{Description.Colour: $average(Price)}

Account.Order.Product{'color': Description.Colour, 'avg': $average(Price)}


$each(Account.Order.Product{Description.Colour: $average(Price)}, function($v, $k) {{'color': $k, 'avg': $v}})

Account.Order.Product{`Product Name`: {'color': Description.Colour, 'avg price': $average(Price), 'sum Quantity': $sum(Quantity)}}

$sort($each(Account.Order.Product{Description.Colour: $average(Price)}, function($v, $k) {{'color': $k, 'avg': $v}}),function($l, $r) {$l.avg > $r.avg})

Account.Order.Product{Description.Colour: $average(Price)} ~> $each(function($v, $k){{'color': $k, 'avg': $v}}) ~> $sort(function($l, $r) {$l.avg > $r.avg})

Account.Order.Product[Description.Colour!='Purple' and Description.Weight>0.6]{Description.Colour: $average(Price)} ~> $each(function($v, $k){{'color': $k, 'avg': $v}}) ~> $sort(function($l, $r) {$l.avg > $r.avg})
```
