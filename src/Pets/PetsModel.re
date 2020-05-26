type kind_t = Dog | Cat;
type size_t = Small | Medium | Large;

[@bs.deriving accessors]
type pet = {
  kind: kind_t,
  size: size_t,
  id: string,
  name: string,
  breed: string,
  weight: float,
  birthdate: Js.Date.t
};

type pets = list(pet);

let getSize = (pet: pet) => 
  switch pet.size {
  | Small => "pequeno"
  | Medium => {j|médio|j}
  | Large => "grande"
  };

module Decode = {
  let pet = json =>
    Json.Decode.{
      id: json |> field("id", string),
      name: json |> field("name", string),
      breed: json |> field("breed", string),
      weight: json |> field("weight", float),
      birthdate: json |> field("birthdate", date),
      kind: json |> map((kind_) => {
        switch kind_ {
        | "Dog" => Dog
        | "Cat" => Cat
        | _ => raise(DecodeError("Invalid kind"))
        };
      }, field("kind", string)),
      size: json |> map((size_) => {
        switch size_ {
        | "Small" => Small
        | "Medium" => Medium
        | "Large" => Large
        | _ => raise(DecodeError("Invalid size"))
        };
      }, field("size", string))
    }

  let pets = json => json |> Json.Decode.list(pet);
}