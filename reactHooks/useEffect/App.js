import "./styles.css";
import React, { useEffect, useState } from "react";

export default function App() {
  const sayHello = () => console.log("hello");
  const [number1, setNumber1] = useState(0);
  const [number2, setNumber2] = useState(0);
  useEffect(sayHello, [number1]);

  return (
    <div className="App">
      <button onClick={() => setNumber1(number1 + 1)}>{number1}</button>
      <button onClick={() => setNumber2(number2 + 1)}>{number2}</button>
    </div>
  );
}


/* useEffect는 componentdidmount, componentdidupdate, componentwillmount 와 비슷한 역할을 한다. 
useEffect( ,[deps]);
deps에서 넣은 값이 변경이 될 시 다시 리렌더링시킨다. 
위 코드는 number1의 버튼을 클릭시마다 렌더링되어 hello가 console에 출력되게 된다.
*/
