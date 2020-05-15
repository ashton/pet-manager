open JSXHelpers
open MenuStyles

[@react.component]
let make = () => {
  <div className=navigation id="navigation">
    <aside className=menu>
        <p className=menuLabel>
            {s("General")}
        </p>
        <ul className="menu-list">
            <li>
                <a className="is-active" href="index.html">
                    <span className="icon">
                        <i className="fa fa-home"></i>
                    </span> {s("Dashboard")}
                </a>
            </li>
            <li>
                <a className="" href="forms.html">
                    <span className="icon">
                        <i className="fa fa-edit"></i>
                    </span> {s("Forms")}
                </a>
            </li>
            <li>
                <a className="" href="elements.html">
                    <span className="icon">
                        <i className="fa fa-desktop"></i>
                    </span> {s("UI Elements")}
                </a>
            </li>
            <li>
                <a className="" href="datatables.html">
                    <span className="icon">
                        <i className="fa fa-table"></i>
                    </span> {s("Datatables")}
                </a>
            </li>
        </ul>

        <p className=menuLabel>
            {s("Sample Pages")}
        </p>
        <ul className="menu-list">
            <li>
                <a className="" href="login.html">
                    <span className="icon">
                        <i className="fa fa-lock"></i>
                    </span> {s("Login")}
                </a>
            </li>
        </ul>
    </aside>
</div>
}