"use client";

import { useEffect, useState } from "react";
import { getSession } from "./auth/actions";

// import { useContext, useEffect } from "react";
// import { AuthContext } from "./contexts/authContext";
import { redirect, useRouter } from "next/navigation";

export default function Home() {

  const router = useRouter();
  let session;
  const loadSession = async() => {
   session = await getSession();
  }

  // const value = useContext(AuthContext)
  
  useEffect(() => {
    
    if (!session || !session.uid) {
      router.push("/login");
    }
    loadSession();
    if(!session || !session.isLoggedIn)
      redirect("/SignIn")
    
  }, [])
  

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      HELLO {session?.email? session.email: '' }
    </main>
  );
}
