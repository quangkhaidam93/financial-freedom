import { defineConfig } from "vite";
import preact from "@preact/preset-vite";
import linaria from "@linaria/vite";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    preact(),
    linaria({
      include: ["**/*.{ts,tsx}"],
      exclude: /node_modules/,
      babelOptions: {
        presets: ["@babel/preset-typescript", "@babel/preset-react"],
      },
    }),
  ],
});
