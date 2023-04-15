open Fetch

let decode = PetsModel.t_decode
let decodeArray = PetsModel.ts_decode
let decodeError = (error: Spice.decodeError) => Js.Exn.raiseError("error decoding data: " ++ error.message)

let fetchAll = async (_): PetsModel.ts => {
  let response = await fetch("https://matheusashton.builtwithdark.com/pets", {method: #GET})

  if response->Response.ok {
    let json = await response->Response.json

    switch decodeArray(json) {
    | Ok(pets) => pets
    | Error(error: Spice.decodeError) => decodeError(error)
    }
  } else {
    Js.Exn.raiseError("Error processing the request: " ++ await response->Response.text)
  }
}

let create = async (pet: PetsModel.t) => {
  let response = await fetch(
    "https://matheusashton.builtwithdark.com/pets",
    {
      method: #POST,
      body: pet->PetsModel.t_encode->Js.Json.stringify->Body.string,
      headers: Headers.fromObject({"Content-type": "application/json"}),
    },
  )

  if response->Response.ok {
    let json = await Response.json(response)
    switch decode(json) {
      | Ok(pet) => pet
      | Error(error: Spice.decodeError) => decodeError(error)
    }
  } else {
    Js.Exn.raiseError("Error processing the request: " ++ await response->Response.text)
  }
}
