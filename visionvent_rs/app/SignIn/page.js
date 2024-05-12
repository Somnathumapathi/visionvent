"use client";
import React, { useContext, useEffect, useState } from 'react'
// import { useRouter } from 'next/navigation';
import { auth } from '../../lib/firebase/firebase';
// import { AuthContext, useAuth } from '../contexts/authContext';
import { signInWithEmailAndPassword } from 'firebase/auth';
import { getSession, login } from '../auth/actions';
import { useRouter } from 'next/navigation';

const page = () => {

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    // const [role, setRole] = useState('researcher')
    const router = useRouter();
    let session;
    const loadSession = async () => {
        session = await getSession();
    }

    useEffect(() => {
        loadSession().then(() =>
            console.log(session))
            .then(() => {
                if (session && session.uid) {
                    router.push("/");
                }
            })
    }, [])

    const handleLogin = async (e) => {
        e.preventDefault()
        if (!email || !password) {
            alert("Please fill all the fields")
            return
        }
        try {
            const result = await signInWithEmailAndPassword(auth, email, password)
            await login(result.user.email, result.user.uid)
            console.log(result)
            // await setUser(newUser)
            // router.push("/")
        } catch (error) {
            console.log(error.message)
        }
    }

    return (
        <>
            <div className=' h-screen flex flex-col justify-center items-center'>
                <h1 className='text-3xl p-4'>SIGN-IN</h1>
                <form onSubmit={(e) => handleLogin(e)} className='flex flex-col justify-center items-center gap-5 text-blue-950'>
                    <input
                        type="text" placeholder="EmailID"
                        className='border-2 border-green-800 rounded-lg p-2 text-lg'
                        value={email}
                        onChange={(e) => setEmail(e.target.value)} required />
                    <input
                        type="password" placeholder="Password"
                        className='border-2 border-green-800 rounded-lg p-2 text-lg'
                        value={password}
                        onChange={(e) => setPassword(e.target.value)} required />
                    {/* <div className='flex justify-center items-center gap-5'>
                        <div>
                            <input type='radio' id="researcher" name="login" value="researcher" checked onChange={e => setRole(e.target.value)} />
                            <label htmlFor='researcher'>Researcher</label>
                        </div>
                        <div>
                            <input type='radio' id="admin" name="login" value="admin" onChange={e => setRole(e.target.value)} />
                            <label htmlFor='admin'>Admin</label>
                        </div>
                    </div> */}
                    <button type='submit' className='w-1/2 border-2 p-2 rounded-lg border-black'>Sign-In</button>
                </form>
            </div>
        </>
    )
}

export default page

