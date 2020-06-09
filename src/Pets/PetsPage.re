open JSXHelpers;
open Belt;

[@react.component]
let make = () => {
  let (pets, setPets) = React.useState(() => []);

  React.useEffect0(() => {
    PetsApi.fetchPets()
    |> Js.Promise.then_((pets) => {
      switch pets {
      | Some(petsList) => Js.Promise.resolve(setPets(_ => petsList))
      | None => Js.Promise.resolve(setPets(_ => []))
      };
    })
    |> ignore;

    None
  });
  
  /* breadcrumbs */
  Breadcrumb.useBreadcrumb([
   { name: "Geral", description: None, url: None, active: false },
   { name: "Pets", description: Some("Meus Pets"), url: Some("/pets"), active: true}
  ]);

  <>
    <div className="colunms">
      <div className="column is-one-third">
      {pets
      ->List.map(item => <PetCard key=item.id pet=item />)
      ->List.toArray
      ->React.array}
      </div>
    </div>

    <div className="control">
      <button onClick={_e => ReasonReactRouter.push("pets/novo")} className="button is-primary">
        {s("Cadastrar Pet")}
      </button>
    </div>
  </>
}