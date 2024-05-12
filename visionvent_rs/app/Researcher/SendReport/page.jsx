"use client";
import React, { useState } from 'react';
import NavBar from '../../../components/Researcher/NavBar';
import axios from 'axios';
import { getSession } from '../../auth/actions';

const AddReport = () => {

  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [report, setReport] = useState('');

  let session
  const loadSession = async() => {
    session = await getSession()
  }
 
  useEffect(() => {
    loadSession().then(()=>{
      if(session && session.email){
        
      }
    })
  }, [])
  

  const handleAddReport = (event) => {
    event.preventDefault();
    const newReport = { title, description };
    setReport(newReport);
    setTitle('');
    setDescription('');
  }

  const result = () => {
    axios
      .post('/api/addReports', report)
      .then(()=>{Navigate('/Researcher/ViewReports')})
      .catch((error) => {
        alert("error!!");
        console.log(error);
      });
  }


  return (
    <div className='researcherbg'>
      <NavBar />
      <div className='flex flex-col justify-center items-center h-screen'>
        <form onSubmit={handleAddReport} className='w-full max-w-md bg-white rounded-xl p-6'>
          <div className='mb-8'>
            <h2 className='text-3xl font-semibold mb-4 text-center'>Add Report</h2>
            <div className='flex flex-col mb-4'>
              <label className='font-semibold mb-2' htmlFor="title">Title:</label>
              <input type="text" className='rounded border border-black py-2 px-3 bg-gray-200' id="title" value={title} onChange={(e) => setTitle(e.target.value)} required />
            </div>
            <div className='flex flex-col mb-4'>
              <label className='font-semibold mb-2' htmlFor="description">Description:</label>
              <textarea className='rounded border border-black bg-gray-200 py-2 px-3' id="description" value={description} onChange={(e) => setDescription(e.target.value)} required />
            </div>
          </div>
          <button className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded' type="submit">Save</button>
        </form>
      </div>
    </div>
  );
}

export default AddReport;
