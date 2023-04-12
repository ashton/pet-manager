type pageType = Dashboard | PetList | Events | MedicalRecord

module type BreadcrumbModule = {
  let path: BreadcrumbModel.breadcrumbPath
}

module type PageMetaModule = {
  let label: string

  let menuIcon: React.element

  let path: string
}

module type PageModule = {
  @react.component
  let make: unit => React.element

  module Breadcrumb: BreadcrumbModule
  module Page: PageMetaModule
}

let petsListPage: module(PageModule) = module(PetsPage)
let dasboardPage: module(PageModule) = module(DashboardPage)
