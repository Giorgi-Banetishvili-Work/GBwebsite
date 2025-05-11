import React, { useEffect, useRef } from 'react';
import './CartOverlay.css';
import { gql, useMutation } from '@apollo/client';

const placeholderImage = 'https://via.placeholder.com/100';

const PLACE_ORDER_MUTATION = gql`
  mutation PlaceOrder($totalPrice: Float!, $items: [OrderItemInput!]!) {
    placeOrder(totalPrice: $totalPrice, items: $items)
  }
`;

export default function CartOverlay({ isOpen, onClose, cartItems = [], setCartItems, triggerRef }) {
  const overlayRef = useRef(null);

 useEffect(() => {
  if (!isOpen) return;

  const handleClickOutside = (event) => {
    const overlayEl = overlayRef.current;
    const triggerEl = triggerRef?.current;

    const clickedOutsideOverlay = overlayEl && !overlayEl.contains(event.target);
    const clickedOutsideTrigger = triggerEl && !triggerEl.contains(event.target);

    if (clickedOutsideOverlay && clickedOutsideTrigger) {
      onClose();
    }
  };

  document.addEventListener('mousedown', handleClickOutside);
  return () => {
    document.removeEventListener('mousedown', handleClickOutside);
  };
}, [isOpen, onClose, triggerRef]);

  if (!Array.isArray(cartItems)) cartItems = [];

  const [placeOrder] = useMutation(PLACE_ORDER_MUTATION);

  const increment = (id, selectedAttributes) => {
    setCartItems(items => {
      const updated = items.map(item =>
        item.id === id &&
        JSON.stringify(item.selectedAttributes) === JSON.stringify(selectedAttributes)
          ? { ...item, quantity: item.quantity + 1 }
          : item
      );

      localStorage.setItem('cart', JSON.stringify(updated));
      return updated;
    });
  };

  const decrement = (id, selectedAttributes) => {
    setCartItems(items => {
      const updated = items
        .map(item =>
          item.id === id &&
          JSON.stringify(item.selectedAttributes) === JSON.stringify(selectedAttributes)
            ? { ...item, quantity: item.quantity - 1 }
            : item
        )
        .filter(item => item.quantity > 0);

      localStorage.setItem('cart', JSON.stringify(updated));

      if (updated.length === 0) {
        onClose(); 
      }

      return updated;
    });
  };

  const totalItems = cartItems.reduce((sum, item) => sum + item.quantity, 0);
  const totalPrice = cartItems.reduce((sum, item) => sum + item.quantity * item.price, 0);

  const handlePlaceOrder = async () => {
    if (cartItems.length === 0) return;

    const items = cartItems.map(item => ({
      productId: item.id,
      productName: item.name,
      price: item.price,
      quantity: item.quantity,
      attributes: JSON.stringify(item.selectedAttributes)
    }));

    try {
      await placeOrder({
        variables: {
          totalPrice,
          items
        }
      });

      setCartItems([]);
      localStorage.removeItem('cart');
      onClose();
    } catch (err) {
      console.error('Failed to place order:', err);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="cart-overlay" ref={overlayRef} data-testid="cart-overlay">
      <h3>My Bag. {totalItems} {totalItems === 1 ? 'Item' : 'Items'}</h3>

      <div className="cart-items">
        {cartItems.map((item) => (
          <div
            className="cart-item"
            key={`${item.id}-${JSON.stringify(item.selectedAttributes)}`}
          >
            <div className="item-details">
              <p className="item-name">{item.name}</p>
              <p className="item-price">
                {item.currencySymbol}{item.price.toFixed(2)}
              </p>

              {item.selectedAttributes &&
                Object.entries(item.selectedAttributes).map(([attrName, selectedVal]) => {
                  const isColor = attrName.toLowerCase() === 'color';
                  const kebab = attrName.toLowerCase().replace(/\s+/g, '-');
                  const options = item.attributes?.find(a => a.name === attrName)?.items || [];

                  return (
                    <div
                      key={attrName}
                      data-testid={`cart-item-attribute-${kebab}`}
                    >
                      <p className="option-label">{attrName}:</p>
                      <div className={isColor ? 'color-group' : 'option-group'}>
                        {options.map((opt, i) => {
                          const isSelected = opt.value === selectedVal;
                          const valueKebab = opt.value.toLowerCase().replace(/\s+/g, '-');
                          const baseTestId = `cart-item-attribute-${kebab}-${valueKebab}`;

                          return isColor ? (
                            <div
                              key={i}
                              className="color-swatch"
                              style={{ backgroundColor: opt.value }}
                              data-testid={`${baseTestId}${isSelected ? '-selected' : ''}`}
                            />
                          ) : (
                            <div
                              key={i}
                              className={`option${isSelected ? ' selected' : ''}`}
                              data-testid={`${baseTestId}${isSelected ? '-selected' : ''}`}
                            >
                              {opt.displayValue}
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  );
                })}
            </div>

            <div className="item-controls">
              <button onClick={() => increment(item.id, item.selectedAttributes)} data-testid="cart-item-amount-increase">+</button>
              <span data-testid="cart-item-amount">{item.quantity}</span>
              <button onClick={() => decrement(item.id, item.selectedAttributes)} data-testid="cart-item-amount-decrease">-</button>
            </div>

            <img
              src={item.image || placeholderImage}
              alt={item.name}
              className="item-image"
            />
          </div>
        ))}
      </div>

      <div className="cart-footer">
        <div className="total-line">
          <span>Total</span>
          <span data-testid="cart-total">${totalPrice.toFixed(2)}</span>
        </div>
        <button
          className="place-order"
          disabled={cartItems.length === 0}
          onClick={handlePlaceOrder}
        >
          PLACE ORDER
        </button>
      </div>
    </div>
  );
}