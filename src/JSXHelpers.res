external s: string => React.element = "%identity"

let pluralize = (quantity, singular, plural) => quantity > 1 ? plural : singular
