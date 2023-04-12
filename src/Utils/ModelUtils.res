let dateEncoder = (value: Js.Date.t) =>
  value
  ->Js.Date.toISOString
  ->Js.Json.string

let dateDecoder = json =>
  switch json->Js.Json.classify {
    | Js.Json.JSONString(str) => Js.Date.fromString(str)->Ok
    | _ => Error({Spice.path: "", message: "Expected JSONString", value: json})
  }

let jsDateCodec: Spice.codec<Js.Date.t> = (dateEncoder, dateDecoder)
