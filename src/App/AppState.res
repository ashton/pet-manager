type t = {
  selectedPet: option<PetsModel.t>,
  currentPage: module(Page.PageModule),
}

let initialUrl = RescriptReactRouter.dangerouslyGetInitialUrl()
let initialPage = Router.urlToPage(initialUrl)

let signal = PreactSignals.React.make({
  selectedPet: None,
  currentPage: initialPage,
})

let setSelectedPet = (pet: PetsModel.t) => {
  open PreactSignals.Core

  signal->set({...signal->val, selectedPet: Some(pet)})
}

let setCurrentPage = (page: module(Page.PageModule)) => {
  open PreactSignals.Core

  signal->set({...signal->val, currentPage: page})
}

let _ = RescriptReactRouter.watchUrl((url: RescriptReactRouter.url) => {
  url->Router.urlToPage->setCurrentPage
})
