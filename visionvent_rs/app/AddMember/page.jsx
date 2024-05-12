"use client";

import NavBar from '../../components/NavBar';
import axios from 'axios';
import React, { useState } from 'react';

const Page = () => {

  // State to store the input values for the new member
  const [name, setName] = useState('');
  const [role, setRole] = useState('');
  const [member, setMember] = useState('');

  // Function to handle adding a new team member
  const handleAddMember = () => {
    // Check if both name and role are provided
    if (name && role) {
      const newMember= {name, role};
      setMember(newMember);
      setName('');
      setRole('');
    } else {
      alert('Please provide both name and role for the new member.');
    }
  };

//   const result = () =>{
//     axios
//     .post('/api/', member)
//     .then(()=>{navigate('/Team')})
//       .catch((error) => {
//         alert("error!!");
//         console.log(error);
//       });
//   }

  return (
    <div className='h-screen'>
      <NavBar />
      <div className='pt-16 mybgyum min-h-screen flex flex-col justify-center items-center'>
          <div className='bg-white w-96 h-96  rounded-lg'>
          <h1 className='text-5xl items-center text-center pt-12 font-bold'>Add Member</h1>
          {/* Render existing team members */}
          {/* Form to input new member details */}
          <div className="flex flex-col items-center mt-4 h-56 w-96 justify-center text-center m-auto">
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="Enter Name"
              className="rounded-lg pl-4 py-2 bg-gray-200 mb-8 w-4/5"
            />
            <input
              type="text"
              value={role}
              onChange={(e) => setRole(e.target.value)}
              placeholder="Enter Role"
              className="rounded-lg pl-4 py-2 bg-gray-200 mb-8 w-4/5"
            />
            <button onClick={handleAddMember} className="bg-[#66a4ce] hover:bg-[#4d8db8] text-white font-bold py-2 px-4 rounded h-10">
              Add Member
            </button>
          </div>
        </div>
          </div>
      </div>
  );
}

export default Page;