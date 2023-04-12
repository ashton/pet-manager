open Fetch

let decodeArray = data => data->PetsModel.ts_decode

let fetchAll = async (_): PetsModel.ts => {
  let response = await fetch("https://matheusashton.builtwithdark.com/pets", {method: #GET})

  if response->Response.ok {
    let json = await response->Response.json

    switch decodeArray(json) {
      | Ok(pets) => pets
      | Error(error: Spice.decodeError) => Js.Exn.raiseError("error decoding data: " ++ error.message)
    }
  } else {
    Js.Exn.raiseError("Error processing the request: " ++ await response->Response.text)
  }
}
