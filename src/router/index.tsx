import Router, { Route } from "preact-router";
import { HomePage, SignInPage } from "../pages";

const AppRouter = () => {
  return (
    <Router>
      <Route
        path="/sign-in/:id"
        component={(props) => <SignInPage {...props} />}
      />
      <Route path="/" component={() => <HomePage />} />
    </Router>
  );
};

export default AppRouter;
