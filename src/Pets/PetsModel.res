open ModelUtils

@spice
type kind = 
  | @spice.as("Dog") Dog
  | @spice.as("Cat") Cat

@spice
type size =
  | @spice.as("Small") Small
  | @spice.as("Medium") Medium
  | @spice.as("Large") Large


@spice
type sex =
  | @spice.as("Male") Male
  | @spice.as("Female") Female


@spice
type t = {
  kind: kind,
  size: size,
  sex: sex,
  id: option<string>,
  name: string,
  breed: string,
  weight: float,
  castrated: bool,
  birthdate: @spice.codec(jsDateCodec) Js.Date.t,
}

@spice
type ts = array<t>

let age = (pet: t): int => {
  Js.Date.make()
  ->ReDate.differenceInYears(pet.birthdate)
  ->Math.round
  ->Float.toInt
}

module Size = {
  let toString = (size: size) =>
    switch size {
      | Small => "small"
      | Medium => "medium"
      | Large => "large"
    }
}
