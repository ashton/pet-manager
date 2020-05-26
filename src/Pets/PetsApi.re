let fetchPets = () => 
  Js.Promise.(
    Fetch.fetch("https://matheusashton.builtwithdark.com/pets")
    |> then_(Fetch.Response.json)
    |> then_(json => 
      json
      ->PetsModel.Decode.pets
      ->Some
      ->resolve
    )
    |> catch(_err => {
        Js.Console.error(_err);
        resolve(None);
       })
  )