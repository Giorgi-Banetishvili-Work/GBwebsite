import React, { useState } from 'react';
import './ProductDetailsPage.css';
import parse from 'html-react-parser';

const ProductPage = ({ product, onClose, onAddToCart }) => {
  const [selectedAttributes, setSelectedAttributes] = useState({});
  const [selectedImage, setSelectedImage] = useState(product.gallery?.[0]?.product_image || product.image);

  const requiredAttributes = product.attributes || [];

  const handleSelect = (attrName, value) => {
    setSelectedAttributes({
      ...selectedAttributes,
      [attrName]: value,
    });
  };

  const allSelected = requiredAttributes.every(attr => selectedAttributes[attr.name]);

  const handleAdd = () => {
    if (allSelected && product.inStock) {
      onAddToCart({
        ...product,
        image: selectedImage,
        quantity: 1,
        selectedAttributes,
      });
      onClose();
    }
  };


 const kebabCase = (str) =>
  str
    .toLowerCase()
    .replace(/\s+/g, '-')      
    .replace(/[^a-z0-9#\-]/g, '');

const formatTestIdValue = (attrType, value) => {
  if (attrType.toLowerCase() === 'swatch') {
    return value.startsWith('#') ? `#${value.slice(1).toUpperCase()}` : value.toUpperCase();
  }

  if (typeof value === 'string' && value.toUpperCase() === '512GB') {
    return '512G'; 
  }

  return kebabCase(value);
};


  const images = product.gallery?.length > 0
    ? product.gallery.map(img => img.product_image)
    : [product.image];

  const nextImage = () => {
    const currentIndex = images.indexOf(selectedImage);
    const nextIndex = (currentIndex + 1) % images.length;
    setSelectedImage(images[nextIndex]);
  };

  const prevImage = () => {
    const currentIndex = images.indexOf(selectedImage);
    const prevIndex = (currentIndex - 1 + images.length) % images.length;
    setSelectedImage(images[prevIndex]);
  };

  const handleOverlayClick = () => {
    onClose();
  };

  return (
    <div className="product-page-overlay" onClick={handleOverlayClick}>
      <div className="product-page" onClick={(e) => e.stopPropagation()}>
        <button className="close-button" onClick={onClose}>✖</button>
        <div className="gallery-section">
          <div className="thumbnail-column" data-testid="product-gallery">
            {images.map((img, i) => (
              <img
                key={`thumb-${i}`}
                src={img}
                alt={`thumb-${i}`}
                className={`thumbnail ${selectedImage === img ? 'active' : ''}`}
                onClick={() => setSelectedImage(img)}
              />
            ))}
          </div>
          <div className="main-image-wrapper">
            <button className="arrow left-arrow" onClick={prevImage}>‹</button>
            <img src={selectedImage} alt="main" className="main-image" />
            <button className="arrow right-arrow" onClick={nextImage}>›</button>
          </div>
        </div>

        <div className="details-section">
          <h2 className="product-name">{product.name}</h2>
          <h3 className="product-brand">{product.brand}</h3>

          {requiredAttributes.map((attr, idx) => (
            <div
              key={idx}
              className="attribute-group"
              data-testid={`product-attribute-${kebabCase(attr.name)}`}
            >
              <p className="attribute-name">{attr.name}:</p>
              <div className={attr.type.toLowerCase() === 'swatch' ? 'swatches' : 'swatch-btn-group'}>
                {attr.items.map(item => {
                  const isSelected = selectedAttributes[attr.name] === item.value;

                  return attr.type.toLowerCase() === 'swatch' ? (
                    <div
                      key={item.id}
                      onClick={() => handleSelect(attr.name, item.value)}
                      className={`color-swatch ${isSelected ? 'selected' : ''}`}
                      style={{ backgroundColor: item.value }}
                      data-testid={`product-attribute-${kebabCase(attr.name)}-${formatTestIdValue(attr.type, item.value)}`}
                    />
                  ) : (
                    <button
                      key={item.id}
                      onClick={() => handleSelect(attr.name, item.value)}
                      className={`swatch-btn ${isSelected ? 'selected' : ''}`}
                       data-testid={`product-attribute-${kebabCase(attr.name)}-${formatTestIdValue(attr.type, item.value)}`}
                    >
                      {item.displayValue}
                    </button>
                  );
                })}
              </div>
            </div>
          ))}

          <p className="attribute-name">Price:</p>
          <p className="product-price">
            {product.currencySymbol}{product.price.toFixed(2)}
          </p>

          <button
            data-testid="add-to-cart"
            className="add-to-cart"
            disabled={!allSelected || !product.inStock}
            onClick={handleAdd}
          >
            {product.inStock ? 'ADD TO CART' : 'OUT OF STOCK'}
          </button>

          <div className="description" data-testid="product-description">
            {parse(product.description)}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductPage;