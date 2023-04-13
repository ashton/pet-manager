@react.component
let make = () => {
  open PreactSignals.Core

  let client = ReactQuery.Provider.createClient()
  let content = PreactSignals.ReactHooks.useComputed(() => {
    let route = AppState.currentPage->val->AppRoutes.byType
    let module(Page) = route.page
    Page.render()
  })


  <ReactQuery.Provider client>
    <TopBar />
    <div className="main-container" id="container">
      <div className="overlay" />
      <div className="search-overlay" />
      <Menu />
      <div className="main-content" id="content">
        <div
          className="layout-px-spacing"
          style={ReactDOM.Style.make(~height="inherit", ~minHeight="inherit", ())}>
          <div
            className="middle-content p-0"
            style={ReactDOM.Style.make(~height="inherit", ~minHeight="inherit", ())}>
            <Header />
            <div
              className="row layout-top-spacing"
              style={ReactDOM.Style.make(~height="inherit", ~minHeight="inherit", ())}>
              <div className="col-md-12"> {content->val} </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </ReactQuery.Provider>
}
