open JSXHelpers

[@react.component]
let make = () => {
  /* breadcrumbs */
  Breadcrumb.useBreadcrumb([
   { name: "Geral", url: None, active: false },
   { name: "Pets", url: Some("/pets"), active: true}
  ]);

  <h1>{s("Pets Page")}</h1>
}