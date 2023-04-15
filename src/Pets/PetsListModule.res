module Meta = {
  let menuIcon = <PetSVG />
  let label = "Pets"
  let urlPath = list{"pets"}
  let breadcrumb: BreadcrumbModel.breadcrumbPath = [
    {name: "Bixin", active: false, url: Some("/")},
    {name: "Pets", active: true, url: Some("/pets")},
  ]
}

module Styles = {
  open CssJs

  let sexIconName = (sex: PetsModel.sex): string =>
    switch sex {
    | Male => "mars"
    | Female => "venus"
    }

  let cardBody = merge(. [style(. [display(#flex), justifyContent(#spaceBetween)]), "card-body"])

  let cardContent = style(. [width(pct(100.0)), marginLeft(px(16))])

  let cardText = merge(. [style(. [marginBottom(px(0))]), "card-text"])

  let petName = style(. [fontSize(px(20)), fontWeight(#semiBold), marginBottom(px(10))])

  let sexIcon = (sex: PetsModel.sex) => {
    let color = switch sex {
    | Male => color(rgb(186, 231, 255))
    | Female => color(rgb(255, 225, 226))
    }

    merge(. ["fas", style(. [color]), `fa-${sexIconName(sex)}`, "fa-lg"])
  }
}

let renderPets = (pets: array<PetsModel.t>) => {
  open PetsModel

  let kindIcon = (kind: kind): string =>
    switch kind {
    | Dog => "dog"
    | Cat => "cat"
    }

  pets->Array.map(pet => {
    <div className="col-xl-3 col-md-4 col-sm-12 layout-spacing">
      <div className="card">
        <div className=Styles.cardBody>
          <div className="avatar avatar-sm">
            <i className={`fas fa-${kindIcon(pet.kind)} fa-3x`} />
          </div>
          <div className=Styles.cardContent>
            <h5 className=Styles.petName> {React.string(pet.name)} </h5>
            <div>
              <p className=Styles.cardText> {React.string(pet.breed)} </p>
              <p className=Styles.cardText>
                {React.string(pet->age->Js.String2.make ++ " ano(s)")}
              </p>
              <p className=Styles.cardText>
                {React.string("porte ")}
                {pet.size->Size.toString->React.string}
              </p>
              <p className=Styles.cardText>
                {React.string(pet.weight->Js.String2.make ++ " kg")}
              </p>
            </div>
          </div>
          <i className={Styles.sexIcon(pet.sex)} />
        </div>
      </div>
    </div>
  })
}

let handleError = (error: string) => [
  <div className="alert alert-danger mb-4">
    <strong> {React.string("Error! ")} </strong>
    {React.string(error)}
  </div>,
]

@react.component
let make = () => {
  open! QueryUtils

  let queryResult = PetsQuery.fetchAll()->handleQueryResult

  let content = switch queryResult {
  | Loaded(pets) => renderPets(pets)
  | Failure(Some(error)) => handleError(error)
  | Failure(None) => handleError("Unexpected error")
  | NotLoaded => [<div />]
  | Loading => [<Loader />]
  }

  <div>
    <button
      className="btn btn-success btn-icon btn-rounded btn-lg position-absolute bottom-0 end-0 mb-4 me-4"
      onClick={_ => Router.navigate(CreatePetModule.Meta.urlPath)}>
      <RoundedPlusSVG />
    </button>

    <div className="row"> {content->React.array} </div>
  </div>
}
