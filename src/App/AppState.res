module Breadcrumb = {
  @bs.deriving(accessors)
  type item = {
    name: string,
    description: option<string>,
    url: option<string>,
    active: bool,
  }

  type path = list<item>
}

type actions = UpdateBreadcrumb(Breadcrumb.path)

type state = {breadcrumb: Breadcrumb.path}

let initialState: state = {breadcrumb: list{}}

let reducer = (_, action: actions) =>
  switch action {
  | UpdateBreadcrumb(path) => {breadcrumb: path}
  }
