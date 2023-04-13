let renderPath = (path: list<string>) =>
  if(List.size(path) > 0) {
    path->List.toArray->Array.reduce("", (acc, cur) => `${acc}/${cur}`)
  } else {
    "/"
  }

let navigate = (path: list<string>) =>
  path->renderPath->RescriptReactRouter.push
