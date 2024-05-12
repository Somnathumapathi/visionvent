// "use server";

import { Inter } from "next/font/google";
import "./globals.css";
// import { AuthProvider } from "../app/contexts/authContext/index";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "VisionVent",
  description: "Generated by create next app",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>
        {/* <AuthProvider> */}
          <div>{children}</div>
        {/* </AuthProvider> */}
      </body>
      <body className={inter.className}>
        <div>{children}</div>
      </body>
    </html>
  );
}
