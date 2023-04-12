@react.component
let make = () => {
  //let (showProfileMenu, setProfileMenuVisible) = React.useState(_ => false);

  <div className="header-container">
    <header className="header navbar navbar-expand-sm">
      <a href="javascript:void(0);" className="nav-link theme-toggle p-0">
      //LOGO
      </a>
      <ul className="navbar-item flex-row ms-lg-auto ms-0">
       <li className="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
         <a href="javascript:void(0);" className="nav-link dropdown-toggle user" id="userProfileDropdown" ariaHaspopup=#"true" ariaExpanded=false>
                        <div className="avatar-container">
                            <div className="avatar avatar-sm avatar-indicators avatar-online">
                                <img alt="avatar" src="" className="rounded-circle"/>
                            </div>
                        </div>
                    </a>

                    <div className="dropdown-menu position-absolute" ariaLabelledby="userProfileDropdown">
                        <div className="user-profile-section">
                            <div className="media mx-auto">
                                <img src="" className="img-fluid me-2" alt="avatar"/>
                                <div className="media-body">
                                    <h5>{React.string("Shaun Park")}</h5>
                                    <p>{React.string("Project Leader")}</p>
                                </div>
                            </div>
                        </div>
                        <div className="dropdown-item">
                            <a href="javascript:void(0);">
                                 <span>{React.string("Profile")}</span>
                            </a>
                        </div>
                        <div className="dropdown-item">
                            <a href="javascript:void(0);">
                                 <span>{React.string("Inbox")}</span>
                            </a>
                        </div>
                        <div className="dropdown-item">
                            <a href="javascript:void(0);">
                                 <span>{React.string("Lock Screen")}</span>
                            </a>
                        </div>
                        <div className="dropdown-item">
                            <a href="javascript:void(0);">
                                 <span>{React.string("Log Out")}</span>
                            </a>
                        </div>
                    </div>
                </li>
      </ul>
      </header>
    </div>

}
