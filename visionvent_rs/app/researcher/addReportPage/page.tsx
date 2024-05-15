"use client"
import React from 'react'

import { useState } from 'react';

function AddReportPage() {

  const [reportName, setReportName] = useState("")
  const [reportDesc, setReportDesc] = useState("")
  const [images, setImages] = useState([]);
  // const [reportName, setReportName] = useState("")
  return (
    <div><div>
      </div>
      
      <label className='mr-3 text-white'>Enter Report Name:</label>
                      <input type='text' className='text-black border-2 border-black rounded-md p-2' value={reportName} onChange={(e) => setReportName(e.target.value)} placeholder='Report Name' /><br/>
                      <label className='mr-3 text-white'>Enter Reprt Description:</label>
                      <input type='text' className='text-black border-2 border-black rounded-md p-2' value={reportDesc} onChange={(e) => setReportDesc(e.target.value)} placeholder='Report Description' /></div>
  )
}

export default AddReportPage