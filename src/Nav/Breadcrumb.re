open JSXHelpers;
open Belt;
open BreadcrumbStyles;

let isItemActive = (item: AppState.breadcrumbItem) => item.active;

let getCurrentItemName = (path: AppState.breadcrumbs) => {
  switch(List.getBy(path, isItemActive)) {
  | Some(item) => item.name
  | None => "Home"
  };
}

let renderItem = (item: AppState.breadcrumbItem) => {
  let item = switch (item.active, item.url) {
  | (_, None) => <span>{s(item.name)}</span>
  | (true, _) => <span className="is-active">{s(item.name)}</span>
  | (false, Some(url)) => <a onClick={_event => ReasonReactRouter.push(url)}>{s(item.name)}</a>
  };

  <li>{item}</li>
};

let useBreadcrumb = (path: AppState.breadcrumbs) => {
  let (_, dispatch) = AppContext.useContext();
  React.useEffect0(() => {
    dispatch(AppState.UpdateBreadcrumb(path));

    None;
  });
};

[@react.component]
let make = () => {
  let (state, _) = AppContext.useContext();

  <div className=contentHeader>
    <h4 className=title>{state.breadcrumb->getCurrentItemName->s}</h4>
    <span className=separator></span>
    <nav className=breadcrumb ariaLabel="breadcrumbs">
      <ul className=list>
        {
        state.breadcrumb
          ->List.map(renderItem)
          ->List.toArray
          ->React.array
        }
      </ul>
    </nav>
  </div>
};
