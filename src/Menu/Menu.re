open JSXHelpers
open MenuStyles

[@react.component]
let make = () => {
  <div className=navigation id="navigation">
    <aside className=menu>
        <p className=menuLabel>
            {s("Geral")}
        </p>
        <ul className="menu-list">
            <li>
                <a className="is-active" onClick={_event => ReasonReactRouter.push("/")}>
                    <span className="icon is-medium">
                        <i className="fa fa-lg fa-home"></i>
                    </span> {s("Dashboard")}
                </a>
            </li>
            <li>
                <a className="" onClick={_event => ReasonReactRouter.push("/pets")}>
                    <span className="icon is-medium">
                        <i className="fa fa-lg fa-paw"></i>
                    </span> {s("Pets")}
                </a>
            </li>
            <li>
                <a className="" href="elements.html">
                    <span className="icon is-medium">
                        <i className="fa fa-lg fa-calendar"></i>
                    </span> {s("Eventos")}
                </a>
            </li>
        </ul>

        <p className=menuLabel>
            {s({j|Dados Médicos|j})}
        </p>
        <ul className="menu-list">
            <li>
                <a className="" href="login.html">
                    <span className="icon is-medium">
                        <i className="fa fa-lg fa-stethoscope"></i>
                    </span> {s("Consultas")}
                </a>
            </li>
        </ul>
    </aside>
</div>
}