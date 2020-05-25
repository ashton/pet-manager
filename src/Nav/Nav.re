open JSXHelpers
open NavStyles

[@react.component]
let make = () => {
  <nav className=appHeader role="navigation" ariaLabel="main navigation" id="app-header">
    <div className=navbarBrand>
      <a className="navbar-item" href="index.html">
        {s("Pets Manager")}
      </a>
      <a role="button" className="navbar-burger" ariaLabel="menu" ariaExpanded={false}>
        <span ariaHidden={true}></span>
        <span ariaHidden={true}></span>
        <span ariaHidden={true}></span>
      </a>
    </div>
    <div id="touchMenu" />

    <div id="navMenu" className="navbar-menu column is-hidden-touch">
      <div className="navbar-end">
        <div className="navbar-item">
          <a className="button is-white">
            <span className="icon">
              <i className="fa fa-lg fa-bell"></i>
            </span>
          </a>
        </div>
        <div className="navbar-item">
          <a className="button is-white">
            <span className="icon">
              <i className="fa fa-lg fa-power-off"></i>
            </span>
          </a>
        </div>
        <div className="navbar-item has-dropdown">
          <a className="navbar-link">
            <figure className="image avatar is-32x32">
                <img className="is-rounded" src="images/user1.png" />
            </figure>
            <span dangerouslySetInnerHTML={{"__html": "&nbsp; Hi, nafplann"}} />
          </a>
          <div className="navbar-dropdown is-right">
            <a className="navbar-item">
              {s("Overview")}
            </a>
            <a className="navbar-item">
              {s("Elements")}
            </a>
            <a className="navbar-item">
              {s("Components")}
            </a>
            <hr className="navbar-divider" />
            <div className="navbar-item">
                {s("Version 0.7.1")}
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>
}