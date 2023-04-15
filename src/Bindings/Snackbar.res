type snackbarOpts

@obj
external makeOptions: (
  ~text: string,
  ~textColor: string=?,
  ~pos: [
    | #"top-left"
    | #"top-center"
    | #"top-right"
    | #"bottom-left"
    | #"bottom-center"
    | #"bottom-right"
  ]=?,
  ~customClass: string=?,
  ~actionText: string=?,
  ~actionTextColor: string=?,
  ~backgroundColor: string=?,
  ~showAction: bool=?,
  ~duration: int=?,
  ~onActionClick: Dom.element => unit=?,
  ~onClose: unit => unit=?,
  unit,
) => snackbarOpts = ""

@module("node-snackbar")
external show: snackbarOpts => unit = "show"
