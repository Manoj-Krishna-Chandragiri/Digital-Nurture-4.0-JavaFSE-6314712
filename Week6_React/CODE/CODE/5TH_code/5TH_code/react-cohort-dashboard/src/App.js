import React from 'react';
import CohortDetails from './components/CohortDetails';

function App() {
  const cohorts = [
  { name: 'React Basics', status: 'ongoing', startDate: '2025-07-10' },
  { name: 'Node Advanced', status: 'completed', startDate: '2025-06-01' },
  { name: 'PL/SQL Fundamentals', status: 'ongoing', startDate: '2025-07-15' }
];


  return (
    <div style={{ padding: '20px' }}>
      {cohorts.map((cohort, index) => (
        <CohortDetails key={index} {...cohort} />
      ))}
    </div>
  );
}

export default App;
