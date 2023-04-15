open ReactUtils

module Meta = {
  let menuIcon = <PetSVG />
  let urlPath = list{"pets", "new"}
  let label = "Cadastrar Pet"
  let breadcrumb: BreadcrumbModel.breadcrumbPath = [
    {name: "Bixin", active: false, url: Some("/")},
    {name: "Pets", active: false, url: Some("/pets")},
    {name: label, active: true, url: Some("/pets/new")},
  ]
}

module Form = %form(
  type submissionError = UnexpectedServerError(string)

  type input = {
    name: string,
    breed: string,
    weight: string,
    birthdate: string,
    castrated: bool,
    sex: string,
    kind: string,
    size: string,
  }

  type output = {
    name: string,
    breed: string,
    weight: float,
    birthdate: Js.Date.t,
    castrated: bool,
    sex: PetsModel.sex,
    kind: PetsModel.kind,
    size: PetsModel.size,
  }

  let validators = {
    name: {
      strategy: OnFirstSuccessOrFirstBlur,
      validate: input => input.name != "" ? Ok(input.name) : Error("por favor preencha o nome"),
    },
    breed: {
      strategy: OnFirstSuccessOrFirstBlur,
      validate: input => input.breed != "" ? Ok(input.breed) : Error(`por favor preencha a raça`),
    },
    weight: {
      strategy: OnFirstSuccessOrFirstBlur,
      validate: input =>
        Js.String2.replace(input.weight, ",", ".")
        ->Float.fromString
        ->Option.mapWithDefault(Error("Digite um peso válido"), weight => Ok(weight)),
    },
    birthdate: {
      strategy: OnFirstSuccessOrFirstBlur,
      validate: input => {
        let date =
          input.birthdate->String.split("/")->Array.reverse->Array.joinWith("-")->Date.fromString // Thx for not having a proper date module JS

        if date->Date.getDate->Int.toFloat->Float.isNaN {
          Error("informe uma data válida")
        } else {
          Ok(date)
        }
      },
    },
    castrated: {
      strategy: OnFirstChange,
      validate: input => Ok(input.castrated),
    },
    size: {
      strategy: OnFirstChange,
      validate: input =>
        input.size
        ->Js.Json.string
        ->PetsModel.size_decode
        ->Result.mapWithDefault(Error("escolha um tamanho válido"), a => Ok(a)),
    },
    sex: {
      strategy: OnFirstChange,
      validate: input =>
        input.sex
        ->Js.Json.string
        ->PetsModel.sex_decode
        ->Result.mapWithDefault(Error("escolha um sexo válido"), a => Ok(a)),
    },
    kind: {
      strategy: OnFirstChange,
      validate: input =>
        input.kind
        ->Js.Json.string
        ->PetsModel.kind_decode
        ->Result.mapWithDefault(Error("escolha uma espécie válida"), a => Ok(a)),
    },
  }
)

module Styles = {
  open CssJs

  let validationResult = merge(. [style(. [display(#block)]), "invalid-feedback"])
}

let errorMessage = (result: option<result<'a, Form.message>>) =>
  switch result {
  | Some(Error(message)) => <div className=Styles.validationResult> {React.string(message)} </div>
  | _ => React.null
  }

let outputAdapter = (output: Form.output): PetsModel.t => {
  id: None,
  name: output.name,
  birthdate: output.birthdate,
  kind: output.kind,
  size: output.size,
  sex: output.sex,
  breed: output.breed,
  weight: output.weight,
  castrated: output.castrated,
}

let errorAlert = (status: Formality.formStatus<Form.submissionError>) =>
  switch status {
  | SubmissionFailed(UnexpectedServerError(error)) =>
    <div className="alert alert-arrow-right alert-icon-right alert-light-danger mb-4" role="alert">
      <AlertOctagonSVG />
      <strong> {s("Operação não efetuada!")} </strong>
      {s(` Erro ao cadastrar pet: ${error}`)}
    </div>
  | _ => React.null
  }

@react.component
let make = () => {
  let initialInput: Form.input = {
    name: "",
    breed: "",
    weight: "",
    birthdate: "",
    castrated: false,
    sex: "",
    kind: "",
    size: "",
  }

  let mutationOpts = ReactQuery.mutationOptions(
    ~mutationFn=PetsAPI.create,
    ~mutationKey=["create-pet"],
    (),
  )

  let mutation = ReactQuery.useMutation(mutationOpts)
  let client = ReactQuery.useQueryClient()

  let createPet = async (pet: PetsModel.t) =>
    try {
      let created = await mutation.mutateAsync(
        pet,
        {
          onSuccess: Some(
            (_, _, _) => {
              let opts = ReactQuery_Types.queryFilter(~queryKey=["pets"], ())
              client.invalidateQueries(Some(opts), None)
            },
          ),
          onError: None,
          onSettled: None,
        },
      )
      Ok(created)
    } catch {
    | Js.Exn.Error(e) =>
      switch Js.Exn.message(e) {
      | Some(message) => Error(message)
      | None => Error("unkonwn error")
      }
    }

  let onFormSubmit = (
    output: Form.output,
    cb: Formality.submissionCallbacks<Form.input, Form.submissionError>,
  ) =>
    output
    ->outputAdapter
    ->createPet
    ->Promise.thenResolve(result =>
      switch result {
      | Error(err) => cb.notifyOnFailure(UnexpectedServerError(err))
      | Ok(_) => {
          open Snackbar

          Snackbar.show(
            makeOptions(
              ~text="Pet cadastrado!",
              ~actionText="Fechar",
              ~showAction=true,
              ~pos=#"bottom-right",
              (),
            ),
          )
          Router.navigate(list{"pets"})
        }
      }
    )
    ->Promise.done

  let form = Form.useForm(~initialInput, ~onSubmit=onFormSubmit)

  <div>
    {errorAlert(form.status)}
    <form
      onSubmit={e => {
        JsxEvent.Form.preventDefault(e)
        form.submit()
      }}>
      <div className="form-group mb-4">
        <label htmlFor="name-input"> {s("Nome")} </label>
        <input
          id="name-input"
          disabled={form.submitting}
          type_="text"
          className="form-control"
          placeholder="nome do seu pet"
          onBlur={_ => form.blurName()}
          onChange={event =>
            form.updateName(
              (input, value) => {...input, name: value},
              (event->ReactEvent.Form.target)["value"],
            )}
        />
        {errorMessage(form.nameResult)}
      </div>
      <div className="form-group mb-4">
        <label htmlFor="weight-input"> {s("Peso")} </label>
        <input
          id="weight-input"
          disabled={form.submitting}
          type_="text"
          className="form-control"
          placeholder="quanto ele pesa em kg"
          onBlur={_ => form.blurWeight()}
          onChange={event =>
            form.updateWeight(
              (input, value) => {...input, weight: value},
              (event->ReactEvent.Form.target)["value"],
            )}
        />
        {errorMessage(form.weightResult)}
      </div>
      <div className="form-group mb-4">
        <label htmlFor="birthdate-input"> {s("Data de nascimento")} </label>
        <MaskedInput
          id="birthdate-input"
          disabled={form.submitting}
          className="form-control"
          mask="99/99/9999"
          onBlur={_ => form.blurBirthdate()}
          onChange={event =>
            form.updateBirthdate(
              (input, value) => {...input, birthdate: value},
              (event->ReactEvent.Form.target)["value"],
            )}
        />
        {errorMessage(form.birthdateResult)}
      </div>
      <fieldset className="row mb-3">
        <legend className="col-form-label col-sm-1 pt-0"> {s("Sexo")} </legend>
        <div className="col-sm-10">
          <div className="form-check form-check-primary">
            <label className="form-check-label" htmlFor="sex-input-male"> {s("Macho")} </label>
            <input
              id="sex-input-male"
              disabled={form.submitting}
              type_="radio"
              className="form-check-input"
              name="sex"
              value="Male"
              onChange={event =>
                form.updateSex(
                  (input, value) => {...input, sex: value},
                  (event->ReactEvent.Form.target)["value"],
                )}
            />
          </div>
          <div className="form-check form-check-primary">
            <label htmlFor="sex-input-female" className="form-check-label"> {s("Fêmea")} </label>
            <input
              id="sex-input-female"
              disabled={form.submitting}
              type_="radio"
              className="form-check-input"
              name="sex"
              value="Female"
              onChange={event =>
                form.updateSex(
                  (input, value) => {...input, sex: value},
                  (event->ReactEvent.Form.target)["value"],
                )}
            />
          </div>
        </div>
        {errorMessage(form.sexResult)}
      </fieldset>
      <fieldset className="row mb-3">
        <legend className="col-form-label col-sm-1 pt-0"> {s("Tamanho")} </legend>
        <div className="col-md-10">
          <div className="form-check form-check-primary">
            <label htmlFor="size-input-small" className="form-check-label"> {s("Pequeno")} </label>
            <input
              id="size-input-small"
              disabled={form.submitting}
              type_="radio"
              className="form-check-input"
              name="size"
              value="Small"
              onChange={event =>
                form.updateSize(
                  (input, value) => {...input, size: value},
                  (event->ReactEvent.Form.target)["value"],
                )}
            />
          </div>
          <div className="form-check form-check-primary">
            <label htmlFor="size-input-medium" className="form-check-label"> {s("Médio")} </label>
            <input
              id="size-input-medium"
              disabled={form.submitting}
              type_="radio"
              className="form-check-input"
              name="size"
              value="Medium"
              onChange={event =>
                form.updateSize(
                  (input, value) => {...input, size: value},
                  (event->ReactEvent.Form.target)["value"],
                )}
            />
          </div>
          <div className="form-check form-check-primary">
            <label htmlFor="size-input-large" className="form-check-label"> {s("Grande")} </label>
            <input
              id="size-input-large"
              disabled={form.submitting}
              type_="radio"
              className="form-check-input"
              name="size"
              value="Large"
              onChange={event =>
                form.updateSize(
                  (input, value) => {...input, size: value},
                  (event->ReactEvent.Form.target)["value"],
                )}
            />
          </div>
        </div>
        {errorMessage(form.sizeResult)}
      </fieldset>
      <div className="form-group mb-3">
        <label htmlFor="kind-select"> {s("Espécie")} </label>
        <select
          className="form-select"
          id="kind-select"
          disabled={form.submitting}
          onBlur={_ => form.blurKind()}
          onChange={e =>
            form.updateKind(
              (input, value) => {...input, kind: value},
              (e->JsxEvent.Form.target)["value"],
            )}>
          <option disabled=true selected=true value=""> {s("Selecione uma espécie")} </option>
          <option value="Cat"> {s("Gato")} </option>
          <option value="Dog"> {s("Cachorro")} </option>
        </select>
        {errorMessage(form.kindResult)}
      </div>
      /* <fieldset className="row mb-3"> */
      /* <legend className="col-form-label col-sm-1 pt-0"> {s("Espécie")} </legend> */
      /* <div className="col-sm-10"> */
      /* <div className="form-check form-check-primary"> */
      /* <label htmlFor="kind-input-cat" className="form-check-label"> {s("Gato")} </label> */
      /* <input */
      /* id="kind-input-cat" */
      /* type_="radio" */
      /* className="form-check-input" */
      /* name="kind" */
      /* value="cat" */
      /* onChange={event => */
      /* form.updateKind( */
      /* (input, value) => {...input, kind: value}, */
      /* (event->ReactEvent.Form.target)["value"], */
      /* )} */
      /* /> */
      /* </div> */
      /* <div className="form-check form-check-primary"> */
      /* <label htmlFor="kind-input-dog" className="form-check-label"> {s("Cachorro")} </label> */
      /* <input */
      /* id="kind-input-dog" */
      /* type_="radio" */
      /* className="form-check-input" */
      /* name="kind" */
      /* value="dog" */
      /* onChange={event => */
      /* form.updateKind( */
      /* (input, value) => {...input, kind: value}, */
      /* (event->ReactEvent.Form.target)["value"], */
      /* )} */
      /* /> */
      /* </div> */
      /* /1* {errorMessage(form.kindResult)} *1/ */
      /* </div> */
      /* </fieldset> */
      <div className="form-group mb-4">
        <label htmlFor="breed-input"> {s("Raça")} </label>
        <input
          id="breed-input"
          disabled={form.submitting}
          type_="text"
          className="form-control"
          placeholder="raça do seu pet"
          onBlur={_ => form.blurBreed()}
          onChange={event =>
            form.updateBreed(
              (input, value) => {...input, breed: value},
              (event->ReactEvent.Form.target)["value"],
            )}
        />
        {errorMessage(form.breedResult)}
      </div>
      <div className="form-check form-check-primary form-check-inline mb-3">
        <label htmlFor="castrated-input" className="form-check-label"> {s("Castrado?")} </label>
        <input
          id="castrated-input"
          disabled={form.submitting}
          type_="checkbox"
          className="form-check-input"
          onChange={event =>
            form.updateCastrated(
              (input, _) => {...input, castrated: (event->ReactEvent.Form.target)["checked"]},
              (event->ReactEvent.Form.target)["checked"],
            )}
        />
        {errorMessage(form.castratedResult)}
      </div>
      <div className="d-flex justify-content-end me-5">
        <button disabled={form.submitting} className="btn btn-primary">
          {React.string("Cadastrar")}
        </button>
      </div>
    </form>
  </div>
}
