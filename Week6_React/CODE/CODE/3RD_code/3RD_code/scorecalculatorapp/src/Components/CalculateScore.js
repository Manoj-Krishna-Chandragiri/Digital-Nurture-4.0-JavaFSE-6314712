// scorecalculatorapp/src/Components/CalculateScore.js
import React from 'react';

function CalculateScore(props) { // [cite: 20]
  const { Name, School, Total, Goal } = props; // [cite: 20]
  const averageScore = Total / Goal; // [cite: 20]

  return (
    <div className="score-card">
      <h2>Student Score Details</h2>
      <p><strong>Name:</strong> {Name}</p>
      <p><strong>School:</strong> {School}</p>
      <p><strong>Total Score:</strong> {Total}</p>
      <p><strong>Goal:</strong> {Goal}</p>
      <h3>Average Score: {averageScore.toFixed(2)}</h3>
    </div>
  );
}

export default CalculateScore;