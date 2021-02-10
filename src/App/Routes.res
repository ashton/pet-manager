let renderContent = url =>
  switch url {
  | list{"pets"} => <PetsPage />
  | list{"pets", "novo"} => <PetsForm />
  | _ => <h1> {React.string("home")} </h1>
  }
