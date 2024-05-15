"use client";

import { useEffect, useState } from "react";
import { getSession } from "./auth/actions";
import Link from "next/link"
import ClipLoader from "react-spinners/ClipLoader"
import HashLoader from "react-spinners/HashLoader"
// import { useContext, useEffect } from "react";
// import { AuthContext } from "./contexts/authContext";
import { redirect, useRouter } from "next/navigation";

export default function Home() {

  const router = useRouter();
  const [session, setSession] = useState(null);
  const loadSession = async () => {
    let sessionData = await getSession();
    setSession(sessionData)
  }

  // const value = useContext(AuthContext)

  useEffect(() => {
    const loadSession = async () => {
      const sessionData = await getSession();
      setSession(sessionData);
    };

    loadSession();
  }, []);

  useEffect(() => {
    if (session !== null) {
      if (!session || !session.uid || !session.isLoggedIn) {
        router.push("/SignIn");
      }
    }
  }, [session, router]);

  if (session === null) {
    return <div className="flex justify-center items-center min-h-screen"><HashLoader color="#3498db" size={60} /></div>;
  }


  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      HELLO {session?.email ? session.email : ''}
      <Link href="/Reports" className="text-red-600 text-3xl">Reports</Link>
    </main>
  );
}
