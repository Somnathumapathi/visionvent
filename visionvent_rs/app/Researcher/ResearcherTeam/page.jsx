import NavBar from '../../../components/Researcher/NavBar'
import TeamMember from '../../../components/TeamMember'
import React from 'react'


const researcherTeam = () => {
  return (

    <div>
      <NavBar />
      <div className='pt-16 researcherbg h-screen'>
      <div className=" bg-gray-100 mx-48 my-4" style={{ height: '96%' }}>
        <h1 className='text-5xl items-center text-center pt-12 font-bold'>Team</h1>
        <div className='grid grid-cols-2 gap-4'>
        <TeamMember e_name='risha' e_role='frontend'/>      
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

export default researcherTeam
