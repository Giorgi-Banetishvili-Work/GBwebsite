import "./Header.css";
import React from "react";
import { NavLink } from "react-router-dom";
import { FaShoppingBag } from "react-icons/fa";
import { FiShoppingCart } from "react-icons/fi";

function Header({ cartItems, setCartItems, isCartOpen, setCartOpen, cartButtonRef }) {
  const totalItems = cartItems.reduce((sum, item) => sum + item.quantity, 0);

  const toggleMenu = () => {
    document.body.classList.toggle("nav-open");
  };

  const getLinkProps = (isActive) => ({
    className: isActive ? "nav-link active" : "nav-link",
    "data-testid": isActive ? "active-category-link" : "category-link",
  });

  return (
    <nav className="nav">
      <div className="left-section">
        <button className="burger" onClick={toggleMenu}>
          <span></span>
          <span></span>
          <span></span>
        </button>

        <div className="nav-links">
          <ul>
            <li>
              <NavLink to="/all" {...getLinkProps(window.location.pathname === "/all")}>
                All
              </NavLink>
            </li>
            <li>
              <NavLink to="/clothes" {...getLinkProps(window.location.pathname === "/clothes")}>
                Clothes
              </NavLink>
            </li>
            <li>
              <NavLink to="/tech" {...getLinkProps(window.location.pathname === "/tech")}>
                Tech
              </NavLink>
            </li>
          </ul>
        </div>
      </div>

      <div className="logo">
        <FaShoppingBag />
      </div>

      <button
        data-testid="cart-btn"
        className="cart-icon"
        ref={cartButtonRef}
        onClick={() => setCartOpen(prev => !prev)}
      >
        <span className="icon-wrapper">
          <FiShoppingCart />
          {totalItems > 0 && (
            <span className="cart-bubble" data-testid="cart-bubble">
              {totalItems}
            </span>
          )}
        </span>
      </button>
    </nav>
  );
}

export default Header;