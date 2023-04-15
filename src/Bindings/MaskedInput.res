@module("react-input-mask") @react.component
external make: (~mask: string, ~id: string=?, ~disabled: bool=?, ~className:string=?, ~maskChar: string=?, ~formatChars: Js.Dict.t<string>=?, ~alwaysShowMask: bool=?, ~onBlur: () => unit, ~onChange: ReactEvent.Form.t => unit) => React.element = "default"
