@react.component
let make = () => {
  let client = ReactQuery.Provider.createClient()
  let url = RescriptReactRouter.useUrl()

  <ReactQuery.Provider client>
      <TopBar />
      <div className="main-container" id="container">
        <div className="overlay" />
        <div className="search-overlay" />
        <Menu />
        <div className="main-content" id="content">
          <div className="layout-px-spacing">
            <div className="middle-content p-0">
              <Header />
              <div className="row layout-top-spacing">
                <div className="col-md-12"> {Router.renderContent(url)} </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </ReactQuery.Provider>
}
