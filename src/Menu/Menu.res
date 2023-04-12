let s = React.string

let menus = [Page.dasboardPage, Page.petsListPage]

module MenuItem = {
  @react.component
  let make = (~page: module(Page.PageModule)) => {
    open PreactSignals.Core
    open PreactSignals.ReactHooks

    let module(PageModule) = page

    let isPageActive = useComputed(() => {
      let module(CurrentPageModule) = val(AppState.signal).currentPage

      CurrentPageModule.Page.path == PageModule.Page.path
    })
    
    let activeClassName = useComputed(() => isPageActive->val ? " active" : "")

    <li className={`menu${activeClassName->val}`}>
      <a
        onClick={(_) => Router.goTo(page)}
        ariaExpanded={isPageActive->val}
        className={`dropdown-toggle${activeClassName->val}`}>
        <div>
          {PageModule.Page.menuIcon}
          <span> {React.string(PageModule.Page.label)} </span>
        </div>
      </a>
    </li>
  }
}

@react.component
let make = () => {
  <div className="sidebar-wrapper sidebar-theme">
    <nav id="sidebar">
      <div className="nav-item sidebar-toggle">
        <div className="btn-toggle sidebarCollapse" />
      </div>
      <ul className="list-unstyled menu-categories ps">
        {menus
        ->Array.map(page => <MenuItem page />)
        ->React.array}
      </ul>
    </nav>
  </div>
  /*
  <div className="sidebar-wrapper sidebar-theme">
    <nav id="compactSidebar">
      <ul className="menu-categories">
        <li onMouseEnter={onHover(Dashboard)} className={`menu ${isActive("")}`}>
          <a onClick={_ => RescriptReactRouter.push("/")} className="menu-toggle">
            <div className="base-menu">
              <div className="base-icons"> <i className="fas fa-home fa-3x" /> </div>
              <span> {s("Dashboard")} </span>
            </div>
          </a>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className="feather feather-chevron-left">
            <polyline points="15 18 9 12 15 6" />
          </svg>
        </li>
        <li onMouseEnter={onHover(Pets)} className={`menu ${isActive("pets")}`}>
          <a className="menu-toggle">
            <div className="base-menu">
              <div className="base-icons"> <i className="fas fa-paw fa-3x" /> </div>
              <span> {s("Pets")} </span>
            </div>
          </a>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className="feather feather-chevron-left">
            <polyline points="15 18 9 12 15 6" />
          </svg>
        </li>
        <li onMouseEnter={onHover(Events)} className={`menu ${isActive("events")}`}>
          <a onClick={_ => RescriptReactRouter.push("/events")} className="menu-toggle">
            <div className="base-menu">
              <div className="base-icons"> <i className="fas fa-calendar-alt fa-3x" /> </div>
              <span> {s("Eventos")} </span>
            </div>
          </a>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className="feather feather-chevron-left">
            <polyline points="15 18 9 12 15 6" />
          </svg>
        </li>
        <li onMouseEnter={onHover(MedicalRecord)} className={`menu ${isActive("medical-records")}`}>
          <a onClick={_e => RescriptReactRouter.push("/medical-history")} className="menu-toggle">
            <div className="base-menu">
              <div className="base-icons"> <i className="fas fa-stethoscope fa-3x" /> </div>
              <span> {s("Consultas")} </span>
            </div>
          </a>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className="feather feather-chevron-left">
            <polyline points="15 18 9 12 15 6" />
          </svg>
        </li>
      </ul>
    </nav>
    <div
      onMouseLeave={_e => setMenu(_ => None)}
      id="compact_submenuSidebar"
      className={`submenu-sidebar ps ${activeMenu->Belt.Option.isSome ? "show" : ""}`}>
      <div className={`submenu ${isMenuActive(Pets)}`}>
        <ul className="submenu-list">
          <li>
            <a onClick={_ => RescriptReactRouter.push("/pets")}>
              <i className="far fa-list-alt fa-lg" /> {React.string("Ver pets")}
            </a>
          </li>
          <li>
            <a onClick={_ => RescriptReactRouter.push("/pets/new")}>
              <i className="far fa-plus-square fa-lg" /> {React.string("Cadastrar pet")}
            </a>
          </li>
        </ul>
      </div>
      <div className={`submenu ${isMenuActive(MedicalRecord)}`}>
        <ul className="submenu-list">
          <li>
            <a onClick={_ => RescriptReactRouter.push("/medical-records")}>
              <i className="far fa-list-alt fa-lg" /> {React.string("Ver consultas")}
            </a>
          </li>
          <li>
            <a onClick={_ => RescriptReactRouter.push("/medical-records/new")}>
              <i className="far fa-plus-square fa-lg" /> {React.string("Cadastrar consulta")}
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
 */
}
