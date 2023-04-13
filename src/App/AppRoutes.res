type pageType =
  | Dashboard
  | PetList
  | CreatePet
  | Events
  | MedicalRecord
  | NotFound

module DashboardPage = Page.Make(DashboardModule)
module PetsListPage = Page.Make(PetsListModule)
module CreatePetPage = Page.Make(CreatePetModule)
module NotFoundPage = Page.Make(NotFoundModule)

type t = {
  pageType: pageType,
  urlPath: list<string>,
  page: module(Page.T),
  isMenu: bool,
}

let notFoundRoute = {
  pageType: NotFound,
  urlPath: list{"not-found"},
  page: module(NotFoundPage),
  isMenu: false,
}

let routes: array<t> = [
  {pageType: Dashboard, urlPath: list{}, page: module(DashboardPage), isMenu: true},
  {pageType: PetList, urlPath: list{"pets"}, page: module(PetsListPage), isMenu: true},
  {pageType: CreatePet, urlPath: list{"pets", "new"}, page: module(CreatePetPage), isMenu: false},
  notFoundRoute,
]

let byPath = (path: list<string>): t =>
  routes
  ->Array.find(({urlPath: itemPath}) => List.eq(path, itemPath, (a, b) => a == b))
  ->Option.getWithDefault(notFoundRoute)

let byType = (pageType: pageType): t =>
  routes
  ->Array.find(({pageType: itemType}) => itemType == pageType)
  ->Option.getWithDefault(notFoundRoute)
