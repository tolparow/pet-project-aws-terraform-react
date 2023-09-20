import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [date, setDate] = useState(new Date());
  const [city, setCity] = useState('');

  useEffect(() => {
    const timerID = setInterval(() => tick(), 1000);
    navigator.geolocation.getCurrentPosition(position => {
      fetch(`https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}&localityLanguage=en`)
        .then(response => response.json())
        .then(data => setCity(data.city));
    });
    return function cleanup() {
      clearInterval(timerID);
    };
  }, []);

  function tick() {
    setDate(new Date());
  }

  return (
    <div className="App">
      <header className="App-header">
        <p>
          Hello, it's {date.toLocaleTimeString()} in {city}
        </p>
      </header>
    </div>
  );
}

export default App;
