type breadcrumbItem = {
  name: string,
  url: option<string>,
  active: bool,
}

type breadcrumbPath = array<breadcrumbItem>

let initial: breadcrumbPath = [
  {name: "Bixin", url: None, active: false},
  {name: "Dashboard", url: Some("/"), active: true},
]
