import { SessionOptions } from "iron-session";

export interface SessionData {
  uid?: string;
  email?: string;
  isLoggedIn: boolean
}

export const defaultSession: SessionData = {
    isLoggedIn: false
}

export const sessionOptions: SessionOptions = {
  password: "Q!WER@TY$%^lohe4#@adEcbDGcfPOsLd",
  cookieName: "AUTH",
  cookieOptions:{
    httpOnly: true,
    secure: false
  }
};
