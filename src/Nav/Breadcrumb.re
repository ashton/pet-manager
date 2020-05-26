open JSXHelpers;
open Belt;
open BreadcrumbStyles;

let getActiveItem = (path: AppState.Breadcrumb.path) => 
  path
  ->List.getBy(AppState.Breadcrumb.active)
  ->Option.getWithDefault({ name: "Home", description: None, url: None, active: false})

let getDescription = (item: AppState.Breadcrumb.item) => 
  item
  ->AppState.Breadcrumb.description
  ->Option.getWithDefault(item.name)

let renderItem = (item: AppState.Breadcrumb.item) => {
  let breadcrumb = switch (item.active, item.url) {
  | (_, None) => <span>{s(item.name)}</span>
  | (true, _) => <span className="is-active">{s(item.name)}</span>
  | (false, Some(url)) => <a onClick={_event => ReasonReactRouter.push(url)}>{s(item.name)}</a>
  };

  <li key=item.name>{breadcrumb}</li>
};

let useBreadcrumb = (path: AppState.Breadcrumb.path) => {
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
    <h4 className=title>{state.breadcrumb->getActiveItem->getDescription->s}</h4>
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
