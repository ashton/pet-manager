type breadcrumbItem = {
  name: string,
  url: option(string),
  active: bool
};

type breadcrumbs = list(breadcrumbItem);

type actions = UpdateBreadcrumb(breadcrumbs)

type state = {
  breadcrumb: breadcrumbs
};

let initialState: state = { breadcrumb: [] };

let reducer = (_, action: actions) => {
  switch action {
  | UpdateBreadcrumb(path) => { breadcrumb: path }
  };
};