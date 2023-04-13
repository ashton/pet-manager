module type T = {
  let render: () => React.element
  let menuIcon: React.element
  let label: string
  let breadcrumbPath: () => BreadcrumbModel.breadcrumbPath
}

module Make = (Page: PageInterface.T): T => {
  let render = () => <Page />

  let menuIcon = Page.Meta.menuIcon
  let label = Page.Meta.label
  let breadcrumbPath = () => Page.Meta.breadcrumb
}
