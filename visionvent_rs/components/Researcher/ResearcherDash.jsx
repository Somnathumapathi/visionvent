import { Avatar } from '@mui/material';
import React from 'react'
import { blue } from '@mui/material/colors';


const researcherDash = () => {
  return (
    <div className='w-full h-full flex-col flex items-center text-center justify-center bg-[#beb3db] text-black border-t-20 border-white'>
        <div className="text-5xl admin-wel">
            <Avatar src='' alt='admin_img' sx={{width:100, height:100, backgroundColor:blue[600], fontSize:'40px'}}>R</Avatar>
        </div>
        <br></br>
        <div className='admin-wel'>
            <h1 className='font-bold text-3xl'>Welcome,</h1>
            <h3 className='text-xl'>researcher_name</h3>
        </div>
    </div>
  );
}

export default researcherDash;