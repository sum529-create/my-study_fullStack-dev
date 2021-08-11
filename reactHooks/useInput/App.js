import "./styles.css";
import React, { useState } from "react";

const useInput = (initialValue, validator) => {
  const [value, setValue] = useState(initialValue);
  const onChange = (event) => {
    const {
      target: { value }
    } = event;
    let willUpdate = true;
    if (typeof validator === "function") {
      willUpdate = validator(value);
    }
    if (willUpdate) {
      setValue(value);
    }
  };
  return { value, onChange };
};
export default function App() {
  const maxLen = (value) => value.length <= 10;
  // const noAt = (value) => !value.includes("@");
  const name = useInput("sum", maxLen);
  return (
    <div className="App">
      <h1>Hello</h1>
      <input placeholder="hi" {...name} />
    </div>
  );
}
