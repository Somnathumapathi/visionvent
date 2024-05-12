"use client";
import { getSession } from '../../auth/actions'
import React, { createContext } from "react";

const session = getSession();

export const AuthContext = createContext({});

export const AuthProvider = ({children}) => {

    const value = {
        uid: session.uid, 
        email: session.email, 
        isLoggedIn: session.isLoggedIn
    }

    return(
        <AuthContext.Provider value={(value)}>
            {children}
        </AuthContext.Provider>
    )

}

