open JSXHelpers
open MenuStyles



[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  
  let isAt = (url: ReasonReactRouter.url, expected: string) => {
    let path = switch url.path {
    | [] => ""
    | _ => url.path->List.hd
    };

    path === expected
  };

  <div className=navigation id="navigation">
    <aside className=menu>
        <p className=menuLabel>
            {s("Geral")}
        </p>
        <ul className="menu-list">
            <li>
                <a className={url->isAt("") ? "is-active" : ""} onClick={_event => ReasonReactRouter.push("/")}>
                    <span className="icon">
                        <i className="fa fa-home"></i>
                    </span> {s("Dashboard")}
                </a>
            </li>
            <li>
                <a className={url->isAt("pets") ? "is-active" : ""} onClick={_event => ReasonReactRouter.push("/pets")}>
                    <span className="icon ">
                        <i className="fa fa-paw"></i>
                    </span> {s("Pets")}
                </a>
            </li>
            <li>
                <a className="" href="elements.html">
                    <span className="icon">
                        <i className="fa fa-calendar"></i>
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
                    <span className="icon">
                        <i className="fa fa-stethoscope"></i>
                    </span> {s("Consultas")}
                </a>
            </li>
        </ul>
    </aside>
</div>
}