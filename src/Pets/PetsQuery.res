let fetchAll = () =>
  ReactQuery.useQuery({
    queryFn: PetsAPI.fetchAll,
    queryKey: ["pets"],
    refetchOnWindowFocus: ReactQuery.refetchOnWindowFocus(#bool(false)),
  })
