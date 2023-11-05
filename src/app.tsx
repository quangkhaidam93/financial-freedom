import "./app.css";
import Header from "./components/layout/Header";
import AppRouter from "./router";

export const App = () => {
  return (
    <>
      <Header />
      <AppRouter />;
    </>
  );
};
