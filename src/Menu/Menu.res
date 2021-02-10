open JSXHelpers
open MenuStyles

@react.component
let make = () => {
  let url = ReasonReactRouter.useUrl()

  let isAt = (url: ReasonReactRouter.url, expected: string) => {
    let path = switch url.path {
    | list{} => ""
    | _ => url.path->List.hd
    }

    path === expected
  }

  <div className=navigation id="navigation">
    <aside className=menu>
      <p className=menuLabel> {s("Geral")} </p>
      <ul className="menu-list">
        <li>
          <a
            className={url->isAt("") ? "is-active" : ""}
            onClick={_event => ReasonReactRouter.push("/")}>
            <span className="icon"> <i className="fa fa-home" /> </span> {s("Dashboard")}
          </a>
        </li>
        <li>
          <a
            className={url->isAt("pets") ? "is-active" : ""}
            onClick={_event => ReasonReactRouter.push("/pets")}>
            <span className="icon "> <i className="fa fa-paw" /> </span> {s("Pets")}
          </a>
        </li>
        <li>
          <a className="" href="elements.html">
            <span className="icon"> <i className="fa fa-calendar" /> </span> {s("Eventos")}
          </a>
        </li>
      </ul>
      <p className=menuLabel> {s(j`Dados Médicos`)} </p>
      <ul className="menu-list">
        <li>
          <a className="" href="login.html">
            <span className="icon"> <i className="fa fa-stethoscope" /> </span> {s("Consultas")}
          </a>
        </li>
      </ul>
    </aside>
  </div>
}
