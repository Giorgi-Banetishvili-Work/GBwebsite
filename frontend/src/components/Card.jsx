import React from 'react';
import './Card.css';
import { FiShoppingCart } from "react-icons/fi";

const toKebabCase = (str) =>
  str.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');

const Card = ({ product, onClick, onQuickAdd, dimmed }) => {
  const isOutOfStock = !product.inStock;

  return (
    <div
      className={`product-card ${isOutOfStock ? 'out-of-stock' : ''} ${dimmed ? 'dimmed' : ''}`}
      data-testid={`product-${toKebabCase(product.name)}`}
      onClick={() => onClick(product)}
    >
      <div className="product-image-wrapper">
        <img
          src={product.image}
          alt={product.name}
          className="product-image"
        />
        {isOutOfStock && <div className="out-of-stock-label">OUT OF STOCK</div>}
      </div>
      <h3>{product.name}</h3>
      <p>{product.currencySymbol}{product.price.toFixed(2)}</p>

      {!isOutOfStock && (
        <div
          className='quick-shop-btn'
          onClick={(e) => {
            e.stopPropagation(); 
            onQuickAdd(product);
          }}
        >
          <FiShoppingCart />
        </div>
      )}
    </div>
  );
};

export default Card;