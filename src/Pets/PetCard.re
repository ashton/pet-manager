open JSXHelpers;
open PetsStyles;

let getIconByKind = (pet: PetsModel.pet) => 
  switch pet.kind {
  | Dog => "fa-dog"
  | Cat => "fa-cat"
  };

[@react.component]
let make = (~pet: PetsModel.pet) => {
  <div className=card>
    <div className="card-content">
      <article className="media">
        <div className="media-left">
          <span className="icon is-large">
            <i className={"fas fa-3x " ++ getIconByKind(pet)} />
          </span>
        </div>
        <div className="media-content">
          <div className="content">
            <p className="title is-4">{s(pet.name)}</p>
            <p className="subtitle is-6">{s(pet.breed)}</p>
            <ul>
              <li>
                <span>{s("5 anos")}</span>
              </li>
              <li>
                <span>{s("porte " ++ PetsModel.getSize(pet))}</span>
              </li>
              <li>
                <span>{s(Js.Float.toFixed(pet.weight) ++ " kg")}</span>
              </li>
            </ul>
          </div>
        </div>
      </article>
    </div>
  </div>
}; 