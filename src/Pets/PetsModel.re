open Belt;

module Kind {
  type t = Dog | Cat;

  let toString = (kind: t): string => 
    switch kind {
    | Dog => "cachorro"
    | Cat => "gato"
    };

  let fromString = (kind: string): Result.t(t, string) =>
    switch kind->Js.String.toLowerCase {
    | "dog" => Ok(Dog)
    | "cat" => Ok(Cat)
    | _ => Error("invalid kind")
    };
}

module Size {
  type t = Small | Medium | Large;

  let toString = (size: t): string =>
    switch size {
    | Small => "pequeno"
    | Medium => {j|médio|j}
    | Large => "grande"
    };

  let fromString = (size: string): Result.t(t, string) =>
    switch size->Js.String.toLowerCase {
    | "small" => Ok(Small)
    | "medium" => Ok(Medium)
    | "large" => Ok(Large)
    | _ => Error("invalid size")
    };
}

[@bs.deriving accessors]
type pet = {
  kind: Kind.t,
  size: Size.t,
  id: string,
  name: string,
  breed: string,
  weight: float,
  birthdate: Js.Date.t
};

type pets = list(pet);

let getAge = (pet: pet) => {
  let now = Js.Date.fromFloat(Js.Date.now());

  DateFns.differenceInYears(now, pet.birthdate)
}

module Decode = {
  let pet = json =>
    Json.Decode.{
      id: json |> field("id", string),
      name: json |> field("name", string),
      breed: json |> field("breed", string),
      weight: json |> field("weight", float),
      birthdate: json |> field("birthdate", date),
      kind: json |> map((kind_) => {
        Kind.fromString(kind_)
        ->Result.getExn
      }, field("kind", string)),
      size: json |> map((size_) => {
        Size.fromString(size_)
        ->Result.getExn
      }, field("size", string))
    }

  let pets = json => json |> Json.Decode.list(pet);
}