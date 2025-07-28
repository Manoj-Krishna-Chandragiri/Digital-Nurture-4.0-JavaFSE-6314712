// scorecalculatorapp/src/App.js
import React from 'react';
import './App.css';
import CalculateScore from './Components/CalculateScore'; 
import './Stylesheets/mystyle.css'; 

function App() {
  return (
    <div className="App">
      <h1>Student Management Portal</h1>
      {/* Invoke the CalculateScore functional component  */}
      <CalculateScore Name="kavya" School="Kendriya Vidyalaya" Total={900} Goal={1000} />
      <CalculateScore Name="Uday Sagar" School="Caramel School" Total={750} Goal={1000} />
      <CalculateScore Name="Konduru" School="DAV School" Total={820} Goal={1000} />
    </div>
  );
}

export default App;