/* 윈도우상에서 저장하지 않았을 시 자동으로 뜨는 confirm */


import "./styles.css";

const usePreventLeave = () => {
  const listener = (event) => {
    event.preventDefault(); // a, submit을 통해 이동하는 것 중단
    event.returnValue = "";
  };

  const enablePrevent = () => window.addEventListener("beforeunload", listener);
  // beforeunload -> window가 닫히기 전에 function이 실행되는것을 허락함
  const disablePrevent = () =>
    window.removeEventListener("beforeunload", listener);
  return { enablePrevent, disablePrevent };
};

export default function App() {
  const { enablePrevent, disablePrevent } = usePreventLeave();
  return (
    <div className="App">
      <button onClick={enablePrevent}>Protect</button>
      <button onClick={disablePrevent}>Unprotect</button>
    </div>
  );
}
