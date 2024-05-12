"use server"

import { getIronSession } from "iron-session"
import { SessionData, defaultSession, sessionOptions } from "./lib"
import { cookies } from "next/headers"
import { redirect } from "next/navigation"

export const getSession = async() => {
    
    const session = await getIronSession<SessionData>(cookies(),sessionOptions);

    if(!session.isLoggedIn || !session){
        session.isLoggedIn = defaultSession.isLoggedIn;
    }

    return session;
}
export const login = async(email:string, uid:string) => {
    const session = await getSession()

    session.isLoggedIn = true;
    session.email = email;
    session.uid = uid;

    await session.save()
    redirect("/")
}
export const logout = async() => {
    const session = await getSession()

    session.destroy();
    redirect("/")

}