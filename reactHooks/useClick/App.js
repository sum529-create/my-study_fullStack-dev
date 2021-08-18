/*
  글씨를 클릭하면 console로 hi~가 출력되고 return으로 이벤트 리스너를 제거해준다.
  useEffect, useRef 사용
*/

import "./styles.css";
import React, { useEffect, useState, useRef } from "react";

const useClick = (onClick) => {
  if (typeof onClick !== "function") {
    return null;
  }
  const element = useRef();
  // componentDidmount
  useEffect(() => {
    if (element.current) {
      element.current.addEventListener("click", onClick);
    }
    // componentwillmount
    return () => {
      if (element.current) {
        // removeEventListner -> 이전에 등록했던 이벤트 리스너 제거
        element.current.removeEventListener("click", onClick);
      }
    };
  }, []);
  return element;
};

export default function App() {
  const sayHi = () => console.log("hi sumin~! ;-) ");
  const title = useClick(sayHi);
  return (
    <div className="App">
      <h1 ref={title}>Jimin hi</h1>
    </div>
  );
}
