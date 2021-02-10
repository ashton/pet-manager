open JSXHelpers

@react.component
let make = () => {
  Breadcrumb.useBreadcrumb(list{
    {name: "Geral", description: None, url: None, active: false},
    {name: "Pets", description: Some("Meus Pets"), url: Some("/pets"), active: false},
    {name: "Cadastrar novo", description: Some("Novo Pet"), url: Some("/pets/new"), active: true},
  })

  <div className="card">
    <div className="card-content">
      <div className="field">
        <label className="label"> {s("Nome")} </label>
        <div className="control">
          <input className="input" type_="text" placeholder="nome do pet" />
        </div>
      </div>
      <div className="field">
        <div className="control">
          <label className="label"> {s(j`Espécie`)} </label>
          <div className="field">
            <input
              id="sizeSmall" className="is-checkradio" type_="radio" name="size" value="Small"
            />
            <label htmlFor="sizeSmall"> {s("Cachorro")} </label>
            <input
              id="sizeMedium" className="is-checkradio" type_="radio" name="size" value="Medium"
            />
            <label htmlFor="sizeMedium"> {s("Gato")} </label>
          </div>
        </div>
      </div>
      <div className="field">
        <div className="control">
          <label className="label"> {s(j`Raça`)} </label>
          <input className="input" type_="text" placeholder=j` raça do pet ` />
        </div>
      </div>
      <div className="field">
        <div className="control">
          <label className="label"> {s("Tamanho")} </label>
          <div className="field">
            <input
              id="sizeSmall" className="is-checkradio" type_="radio" name="size" value="Small"
            />
            <label htmlFor="sizeSmall"> {s("Pequeno")} </label>
            <input
              id="sizeMedium" className="is-checkradio" type_="radio" name="size" value="Medium"
            />
            <label htmlFor="sizeMedium"> {s(j`Médio`)} </label>
            <input
              id="sizeLarge" className="is-checkradio" type_="radio" name="size" value="Large"
            />
            <label htmlFor="sizeLarge"> {s("Grande")} </label>
          </div>
        </div>
      </div>
      <div className="field">
        <div className="control">
          <label className="label"> {s("Peso")} </label>
          <input className="input" type_="text" placeholder="peso do pet" />
        </div>
      </div>
      <div className="field">
        <div className="control">
          <label className="label"> {s("Data de nascimento")} </label>
          <input className="input" type_="text" placeholder="aniversario do pet" />
        </div>
      </div>
    </div>
  </div>
}
