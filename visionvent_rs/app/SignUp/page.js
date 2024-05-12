"use client";
import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { auth } from '../../lib/firebase/firebase';
import { createUserWithEmailAndPassword } from 'firebase/auth';
// import { AuthContext } from '../contexts/authContext';
import { useRouter } from 'next/navigation';
import { getSession } from '../auth/actions';

const page = () => {

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [role, setRole] = useState('researcher')

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


  const handleSignUp = async (e) => {
    e.preventDefault()
    if (!email || !password || !role) {
      alert("Please fill all the fields")
      return
    }
    try {
      const result = await createUserWithEmailAndPassword(auth, email, password)
      await login(result.user.email, result.user.uid)
      console.log(result.user)
      const data = JSON.stringify({ email, role, uid: result.user.uid })
      console.log(data)
      try {
        const result = await axios.post("/api/signup", data)
        console.log(result.data)
      } catch (error) {
        console.log(error.message)
      }
    } catch (error) {
      console.log(error)
    }
  }
  return (
    <div className=' h-screen flex flex-col justify-center items-center'>
      <h1 className='text-3xl p-4'>SIGN-UP</h1>

      <form onSubmit={(e) => handleSignUp(e)} className='flex flex-col justify-center items-center gap-5 text-blue-950'>
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
  )
}

export default page

