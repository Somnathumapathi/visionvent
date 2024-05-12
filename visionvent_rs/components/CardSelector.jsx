import React from 'react'
import CardTab from './CardTab'

const CardSelector = () => {
  return (
    <div className='w-full h-full flex-col flex items-center text-center justify-center'>
      <div className='grid grid-cols-2 gap-x-16 gap-y-16'>
        <CardTab content="Center" desc="About the institute"/>
        <CardTab content="Reports" desc="Approve reports"/>
      </div>
      <div className='mt-12'><CardTab content="Team" desc="Manage team members"/></div>
    </div>
  )
}

export default CardSelector