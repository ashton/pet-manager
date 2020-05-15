open AppStyles

[@react.component]
let make = () => {
    <>
        <Nav />
        <div className=appContent id="appContent">
          <Menu />
        </div>
    </>
}