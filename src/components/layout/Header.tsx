import { styled } from "@linaria/react";

const Header = () => {
  return (
    <Container>
      <Logo>2F</Logo>
    </Container>
  );
};

export default Header;

const Container = styled.div`
  height: 40px;
  background: khaki;
  padding: 12px 32px;
  display: flex;
  align-items: center;
`;

const Logo = styled.div`
  color: red;
  font-size: 24px;
  font-weight: 700;
`;
