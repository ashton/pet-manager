type remoteData<'a, 'b> =
  | NotLoaded
  | Loading
  | Loaded('a)
  | Failure('b)

let handleQueryResult = (result: ReactQuery.queryResult<Js.Exn.t, 'queryResult>): remoteData<
  'queryData,
  option<string>,
> =>
  switch result {
  | {isLoading: true} => Loading
  | {data: Some(data), isLoading: false, isError: false} => Loaded(data)
  | {data: None, error, isLoading: false, isError: true} =>
    error->Js.Nullable.toOption->Option.getExn->Js.Exn.message->Failure
  | _ => Failure(Some("unknown error"))
  }

let mutationOnError = Some((error, _, _) => Promise.resolve(Error(error)))
