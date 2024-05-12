import React from 'react'
import ResearcherCardTab from './ResearcherCardTab';
import './r_cardTab.css';

const researcherCard = () => {
  return (
    <div className='w-full h-full flex-col flex items-center text-center justify-center researcherbg'>
      <div className='grid grid-cols-2 gap-x-16 gap-y-16'>
        <ResearcherCardTab content="Reports" desc="Write reports" urltext='/Researcher/SendReport/'/>
        <ResearcherCardTab content="Team" desc="Manage team members" urltext='/Researcher/ResearcherTeam'/>
      </div>
    </div>
  );
}

export default researcherCard;