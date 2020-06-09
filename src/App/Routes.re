let renderContent = (url) => {
  switch (url) {
  | ["pets"] => <PetsPage />
  | ["pets", "novo"] => <PetsForm />
  | _ => <h1>{React.string("home")}</h1>
  }
};