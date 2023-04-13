module Meta = {
  let label = "Page not found"
  let menuIcon = React.null
  let urlPath = list{"not-found"}
  let breadcrumb: BreadcrumbModel.breadcrumbPath = []
}

@react.component
let make = () => <span>{React.string("not found")}</span>
