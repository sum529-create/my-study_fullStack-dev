import { StrictMode } from "react";
import ReactDOM from "react-dom";

import App, { AppCal } from "./App";

const rootElement = document.getElementById("root");
ReactDOM.render(
  <StrictMode>
    <App />
    <AppCal />
  </StrictMode>,
  rootElement
);
