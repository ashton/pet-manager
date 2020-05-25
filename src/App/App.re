open AppStyles

let renderContent = (url) => {
  switch (url) {
  | ["pets"] => <PetsPage />
  | _ => <h1>{React.string("home")}</h1>
  }
};

[@react.component]
let make = () => {
  let (state, dispatch) = React.useReducer(AppState.reducer, AppState.initialState);
  let url = ReasonReactRouter.useUrl();

  <>
    <Nav />
    <div className=appContent id="appContent">
      <Menu />
      <div className=pageContent id="page-content">
        <AppContextProvider value=(state, dispatch)>
          <Breadcrumb />
          {renderContent(url.path)}
        </AppContextProvider>
      </div>
    </div>
  </>
}