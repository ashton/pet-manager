open! QueryUtils
open ReactUtils

module PetsSelectbox = {
  let renderPetOption = (onSelect: PetsModel.t => unit, pet: PetsModel.t) => {
    <a onClick={_ => onSelect(pet)} className="dropdown-item" href="javascript:void(0);">
      {s(pet.name)}
    </a>
  }

  @react.component
  let make = (~pets: remoteData<PetsModel.ts, option<string>>, ~onSelect: PetsModel.t => unit) => {
    open PreactSignals.Core

    let (opened, setOpened) = React.useState(() => false)
    let closeSelectbox = () => setOpened(_ => false)
    let hookInput = DetectOutsideClick.makeInput(~onTriggered=closeSelectbox)
    let elementRef = DetectOutsideClick.useHook(hookInput)
    let selectAndClose = (pet: PetsModel.t) => {
      onSelect(pet)
      closeSelectbox()
    }

    let activeClass = if opened {
      " show"
    } else {
      ""
    }

    let label = computed(() =>
      switch AppState.signal->val {
      | {selectedPet: Some(pet)} => pet.name
      | {selectedPet: None} => "Selecione seu pet"
      }
    )

    <div ref={ReactDOM.Ref.domRef(elementRef)} className="dropdown custom-dropdown-icon">
      <a
        className={`dropdown-toggle btn _effect--ripple ${activeClass}`}
        role="button"
        id="customDropdown"
        ariaHaspopup=#"true"
        ariaExpanded={opened}
        onClick={_ => setOpened(current => !current)}>
        <span> {s(label->val)} </span>
        <ChevronDownSVG />
      </a>
      <div
        style={ReactDOM.Style.make(~top="35px", ())}
        className={`dropdown-menu dropdown-menu-right ${activeClass}`}
        ariaLabelledby="customDropdown">
        {switch pets {
        | NotLoaded => [React.null]
        | Loading => [React.null]
        | Loaded(pets) => pets->Array.map(renderPetOption(selectAndClose))
        | Failure(Some(_error)) => [React.null]
        | Failure(None) => [React.null]
        }->React.array}
      </div>
    </div>
  }
}

@react.component
let make = () => {
  open PreactSignals.Core
  open PreactSignals.ReactHooks

  let queryResult = PetsQuery.fetchAll()->handleQueryResult
  let onSelect = AppState.setSelectedPet
  let breadcrumbPathSignal = useComputed(() => {
    let route = AppState.currentPage->val->AppRoutes.byType
    let module(PageModule: Page.T) = route.page
    PageModule.breadcrumbPath()
  })

  <div className="secondary-nav">
    <div className="breadcrumbs-container">
      <header className="header navbar navbar-expand-sm">
        <a className="btn-toggle sidebarCollapse">
          <MenuSVG />
        </a>
        <div className="d-flex breadcrumb-content">
          <div className="page-header">
            <div className="page-title" />
            <Breadcrumb path={breadcrumbPathSignal->val} />
          </div>
        </div>
        <ul className="navbar-nav flex-row ms-auto breadcrumb-action-dropdown">
          <li className="nav-item more-dropdown">
            <PetsSelectbox pets={queryResult} onSelect />
          </li>
        </ul>
      </header>
    </div>
  </div>
}
