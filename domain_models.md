

# DOMAIN MODELS

## User stories
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

```
## Nouns
- person [name]
- bike [id]
- docking station [location]

## Verbs
- use [bike]
- release [bike from docking station]
- see [working bike]


Objects  | Messages
------------- | -------------
Person  |
Bike  | find_by_docking_station
Bike  | see_condition
Bike  | using_bike
DockingStation | release_bike
