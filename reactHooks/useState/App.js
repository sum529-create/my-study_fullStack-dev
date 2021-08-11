import "./styles.css";
import React, { useState } from "react";

export default function App() {
  const [item, setItem] = useState(1);
  const add = () => {
    setItem(item + 2);
  };
  const minus = () => {
    setItem(item - 2);
  };

  return (
    <div className="App">
      <h1>Hello {item} CodeSandbox</h1>
      <h2>Start editing to see some magic happen!</h2>
      <button onClick={add}>+2</button>
      <button onClick={minus}>-2</button>
    </div>
  );
}

export class AppCal extends React.Component {
  state = {
    item: 2
  };
  multiple = () => {
    this.setState((state) => {
      return {
        item: state.item * 2
      };
    });
  };
  divide = () => {
    this.setState((state) => {
      return {
        item: state.item / 2
      };
    });
  };
  render() {
    const { item } = this.state;
    return (
      <div className="App">
        <h1>Hello {item} CodeSandbox2</h1>
        <h2>Start editing to see some magic happen!</h2>
        <button onClick={this.multiple}>x2</button>
        <button onClick={this.divide}>/2</button>
      </div>
    );
  }
}
