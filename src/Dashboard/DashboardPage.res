module Page = {
  let label = "Dashboard"
  let menuIcon = <HomeSVG />
  let path = ""
}

module Breadcrumb = {
  let path: BreadcrumbModel.breadcrumbPath = [
    {name: "Bixin", active: false, url: None},
    {name: "Dashboard", active: true, url: Some("/")},
  ]
}

@react.component
let make = () => <div> {React.string("Home")} </div>
