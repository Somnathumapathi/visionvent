import NavBar from '../../components/NavBar'
import TeamMember from '../../components/TeamMember'
import Link from 'next/link'
import React from 'react'
import AddIcon from '@mui/icons-material/Add';


const page = () => {
  return (

    <div>
      <NavBar />
      <div>
      </div>
      <div className='pt-16 mybgyum h-full'>
      <div className=" bg-gray-100 mx-48 my-4" style={{ height: '96%' }}>
        <div className='flex justify-center text-center items-center gap-8 pt-12'>
        <h1 className='text-5xl items-center text-center font-bold'>Team</h1>
        <div className='pt-2'><Link href='/AddMember'><button className='h-12 w-12 bg-black text-white rounded-lg'><AddIcon/></button></Link></div>
        </div>
        <div className='grid grid-cols-2 gap-4'>
        <TeamMember e_name='risha' e_role='frontend'/>
        <TeamMember e_name='risha' e_role='frontend'/>
        <TeamMember e_name='risha' e_role='frontend'/>
        <TeamMember e_name='risha' e_role='frontend'/>
      </div>
    </div>
    </div>
    </div>
  )
}

export default page
