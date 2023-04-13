module Meta = {
  let menuIcon = <PetSVG />
  let urlPath = list{"pets", "new"}
  let label = "Cadastrar Pet"
  let breadcrumb: BreadcrumbModel.breadcrumbPath = [
    {name: "Bixin", active: false, url: Some("/")},
    {name: "Pets", active: false, url: Some("/pets")},
    {name: label, active: true, url: Some("/pets/new")},
  ]
}

@react.component
let make = () => {
  <div />
}
