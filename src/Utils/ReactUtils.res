let s = React.string

module DetectOutsideClick = {
  type input

  @obj external makeInput: (~onTriggered: () => ()) => input = ""

  @module("react-detect-click-outside")
  external useHook: input => React.ref<Js.Nullable.t<Dom.element>> = "useDetectClickOutside"
}

