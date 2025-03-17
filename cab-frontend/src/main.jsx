import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import favicon from './assets/cabwadlogo.png'

const link = document.createElement('link')
link.rel = 'icon'
link.href = favicon
document.head.appendChild(link)

// Import Bootstrap CSS
import 'bootstrap/dist/css/bootstrap.min.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <App />
);
