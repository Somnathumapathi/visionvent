import React from 'react'
import DeleteIcon from '@mui/icons-material/Delete';
import { Avatar } from '@mui/material'


const TeamMember = ({e_name, e_role, e_src}) => {
  return (
    <div className='flex flex-col justify-center items-center text-center'>
      <div className='h-52 bg-gray-200 m-8 mt-16 p-12 rounded-lg flex justify-between text-center items-center w-96'>
    <div className='flex-col justify-start text-left'>
      <h1 className='font-bold text-xl mb-4'>Name:<span className='font-normal ml-4'>{e_name}</span></h1>
      <p className='font-bold text-xl'>Role:<span className='font-normal ml-4'>{e_role}</span></p>
    </div>
    <DeleteIcon className='mt-4 cursor-pointer' />
  </div>
    </div>
  )
}

export default TeamMember