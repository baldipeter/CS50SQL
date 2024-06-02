# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Pro:
As each boat will see similar amounts of traffic there is a low chance of a hot spot forming, which makes this approach appealing as we don't want to lose any data point.
Also, the three boats should have similar computing powers, which (I believe) might be the cheapest option.
Con:
On the other hand all three boats have to be queried if you want any data.
Undecided:
I'm unsure if one server is down how random partitioning reacts.
If it then randomly distributes the data to the remaining servers it is also a selling point, but if about a third of the data is lost, then it is a big drawback.

## Partitioning by Hour

Pro:
If you want to query based on time you know exactly which boat you can find the data.
Con:
Incorrect usage of resources, as one boat is overloaded, while an other is unused. If that boat goes out of commission the data is lost.

## Partitioning by Hash Value

Pro:
All resources are used correctly as data is distributed on all boats. If a specific timepoint is of interest only one boat has to be queried.
Con:
All three boats have to be queried if you want more than one observation data.
Undecided:
I'm unsure if one server is down how hash value partitioning reacts (same as in random partitioning).
