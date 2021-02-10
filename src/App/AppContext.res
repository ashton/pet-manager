open AppState

type dispatch = actions => unit
type contextValue = (state, dispatch)

let initValue: contextValue = (initialState, _ => ignore())

let context = React.createContext(initValue)
let useContext = () => React.useContext(context)
