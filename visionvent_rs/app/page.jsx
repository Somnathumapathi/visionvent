"use client";

import { useEffect, useState } from "react";
import { getSession } from "./auth/actions";

// import { useContext, useEffect } from "react";
// import { AuthContext } from "./contexts/authContext";
import { redirect, useRouter } from "next/navigation";
import DashBoard from "../components/DashBoard";
import Link from "next/link";

export default function Home() {

  const router = useRouter();
  let session;
  const loadSession = async () => {
    session = await getSession();
  }

  // const value = useContext(AuthContext)

  useEffect(() => {

    loadSession().then(() =>
      console.log(session)).then(() => {

        if (!session || !session.uid) {
          router.push("/SignIn");
        }
        if (!session || !session.isLoggedIn)
          redirect("/SignIn");
      })

  }, [])


  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      HELLO {session?.email ? session.email : ''}
      <DashBoard />
      <Link href={'/Reports'}>Reports</Link>
    </main>
  );
}
