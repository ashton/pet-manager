let isAt = (url: RescriptReactRouter.url, expected: string): bool => {
  switch List.head(url.path) {
  | None => expected == ""
  | Some(path) => path == expected
  }
}

let goTo = (menu: Page.t) => {
  RescriptReactRouter.push(`/${menu.path}`)
}

let urlToPage = (url: RescriptReactRouter.url) => {
  switch url.path {
    | list{"pets"} => Page.petsPage
    | list{"events"} => Page.eventsPage
    | list{"medical-records"} => Page.recordPage
    | _ => Page.dashboardPage
  }
}

let renderContent = (url: RescriptReactRouter.url) => urlToPage(url).component
