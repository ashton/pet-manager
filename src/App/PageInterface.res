module type PageMetaModule = {
  let label: string
  let menuIcon: React.element
  let urlPath: list<string>
  let breadcrumb: BreadcrumbModel.breadcrumbPath
}

module type T = {
  module Meta: PageMetaModule

  @react.component
  let make: unit => React.element
}
