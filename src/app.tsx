import "./app.css";
import { styled } from "@linaria/react";

const Container = styled.div`
  background: red;
  width: 200;
  height: 200;
`;

export const App = () => {
  return (
    <>
      <Container>Hello World</Container>
    </>
  );
};
