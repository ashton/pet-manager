let isAt = (url: RescriptReactRouter.url, expected: string): bool => {
  switch List.head(url.path) {
  | None => expected == ""
  | Some(path) => path == expected
  }
}

let goTo = (page: module(Page.PageModule)) => {
  let module(PageModule) = page
  RescriptReactRouter.push(`/${PageModule.Page.path}`)
}

let urlToPage = (url: RescriptReactRouter.url): module(Page.PageModule) => {
  switch url.path {
  | list{"pets"} => Page.petsListPage
  /* | list{"events"} => Page.eventsPage */
  /* | list{"medical-records"} => Page.recordPage */
  | _ => Page.dasboardPage
  }
}

let renderContent = (url: RescriptReactRouter.url) => {
  let module(Page) = urlToPage(url)
  <Page />
}
