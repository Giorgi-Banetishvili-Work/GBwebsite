import React, { useState, useEffect, useRef } from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import All from './pages/All';
import Tech from './pages/Tech';
import Clothes from './pages/Clothes';
import Header from './components/Header';
import CartOverlay from './pages/CartOverlay';

const App = () => {
  const [cartItems, setCartItems] = useState([]);
  const [isCartOpen, setCartOpen] = useState(false);
  const cartButtonRef = useRef(null);

  useEffect(() => {
    const storedCart = localStorage.getItem('cart');
    if (storedCart) setCartItems(JSON.parse(storedCart));
  }, []);

  useEffect(() => {
    localStorage.setItem('cart', JSON.stringify(cartItems));
  }, [cartItems]);

  return (
    <Router>
      <Header
        cartItems={cartItems}
        setCartItems={setCartItems}
        isCartOpen={isCartOpen}
        setCartOpen={setCartOpen}
        cartButtonRef={cartButtonRef}
      />

      <CartOverlay
    isOpen={isCartOpen}
    onClose={() => setCartOpen(false)}
    cartItems={cartItems}
    setCartItems={setCartItems}
    triggerRef={cartButtonRef}
  />
  
      <Routes>
        <Route
          path="/all"
          element={<All cartItems={cartItems} setCartItems={setCartItems} isCartOpen={isCartOpen} setCartOpen={setCartOpen} />}
        />
        <Route
          path="/tech"
          element={<Tech cartItems={cartItems} setCartItems={setCartItems} isCartOpen={isCartOpen} setCartOpen={setCartOpen} />}
        />
        <Route
          path="/clothes"
          element={<Clothes cartItems={cartItems} setCartItems={setCartItems} isCartOpen={isCartOpen} setCartOpen={setCartOpen} />}
        />
        <Route path="/" element={<Navigate to="/all" replace />} />
      </Routes>
    </Router>
  );
};

export default App;