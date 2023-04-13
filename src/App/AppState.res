open PreactSignals.Core

type t = {
  selectedPet: option<PetsModel.t>,
  currentPage: AppRoutes.pageType,
}

let initialUrl = RescriptReactRouter.dangerouslyGetInitialUrl()
let initialPage = AppRoutes.byPath(initialUrl.path).pageType

let signal = PreactSignals.React.make({
  selectedPet: None,
  currentPage: initialPage,
})

let setSelectedPet = (pet: PetsModel.t) => {
  signal->set({...signal->val, selectedPet: Some(pet)})
}

let setCurrentPage = (page: AppRoutes.pageType) => {
  signal->set({...signal->val, currentPage: page})
}

let currentPage = computed(() => val(signal).currentPage)

let _ = RescriptReactRouter.watchUrl((url: RescriptReactRouter.url) => {
  let route = AppRoutes.byPath(url.path)
  setCurrentPage(route.pageType)
})
