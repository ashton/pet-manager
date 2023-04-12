type pageType = Dashboard | PetList | Events | MedicalRecord

type t = {
  page: pageType,
  path: string,
  icon: React.element,
  label: string,
  component: React.element,
  breadcrumb: BreadcrumbModel.breadcrumbPath
}

let dashboardPage: t = {
  page: Dashboard,
  path: "",
  icon: <HomeSVG />,
  label: "Home",
  component: <div />,
  breadcrumb: BreadcrumbModel.initial
}

let petsPage: t = {
  page: PetList,
  path: "pets",
  icon: <PetSVG />,
  label: "Pets",
  component: <PetsPage />,
  breadcrumb: PetsPage.Breadcrumb.path
}

let eventsPage: t = {
  page: Events,
  path: "events",
  icon: <CalendarSVG />,
  label: "Lembretes",
  component: <div />,
  breadcrumb: BreadcrumbModel.initial
}

let recordPage: t = {
  page: MedicalRecord,
  path: "medical-record",
  icon: <HealthSVG />,
  label: "Consultas",
  component: <div />,
  breadcrumb: BreadcrumbModel.initial
}

let pages = [dashboardPage, petsPage, eventsPage, recordPage]
