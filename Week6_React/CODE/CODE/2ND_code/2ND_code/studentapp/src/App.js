// src/App.js
import React from 'react';
import Home from './Components/Home';
import About from './Components/About';
import Contact from './Components/Contact';
import './App.css'; // Assuming you still want the default App.css

function App() {
  return (
    <div className="App">
      <header className="App-header">
        {/* You can add a common header here if you like */}
        <h1>Student Management Portal</h1>
      </header>
      <main>
        <Home />
        <About />
        <Contact />
      </main>
    </div>
  );
}

export default App;