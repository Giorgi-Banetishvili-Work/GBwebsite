import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { useQuery, gql } from '@apollo/client';
import './ProductListingPage.css';
import Card from './Card';
import ProductPage from '../pages/ProductDetailsPage';


const GET_ALL_PRODUCTS = gql`
  query {
    products {
      id
      name
      image
      price
      currencySymbol
      description
      inStock
      gallery {
        id
        product_image
      }
      attributes {
        name
        type
        items {
          id
          displayValue
          value
        }
      }
    }
  }
`;

const GET_PRODUCTS_BY_CATEGORY = gql`
  query GetProductsByCategory($category: String!) {
    productsByCategory(category: $category) {
      id
      name
      image
      price
      currencySymbol
      description
      inStock
      gallery {
        id
        product_image
      }
      attributes {
        name
        type
        items {
          id
          displayValue
          value
        }
      }
    }
  }
`;

const ProductListingPage = ({ cartItems, setCartItems, isCartOpen, setCartOpen }) => {
  const [selectedProduct, setSelectedProduct] = useState(null);
  const location = useLocation();

  const getCategory = () => {
    switch (location.pathname) {
      case '/clothes':
        return 'clothes';
      case '/tech':
        return 'tech';
      case '/all':
        return null; 
      default:
        return null;
    }
  };

  const getHeading = () => {
    switch (location.pathname) {
      case '/clothes':
        return 'Clothes';
      case '/tech':
        return 'Tech';
      case '/all':
        return 'All';
      default:
        return 'All';
    }
  };

  const category = getCategory();

  const { loading: loadingAll, error: errorAll, data: dataAll } = useQuery(GET_ALL_PRODUCTS, {
    skip: !!category,
  });

  const { loading: loadingCategory, error: errorCategory, data: dataCategory } = useQuery(
    GET_PRODUCTS_BY_CATEGORY,
    {
      variables: { category },
      skip: !category,
    }
  );

  const loading = loadingAll || loadingCategory;
  const error = errorAll || errorCategory;
  const products = category ? dataCategory?.productsByCategory : dataAll?.products;

  useEffect(() => {
    const stored = localStorage.getItem('cart');
    if (stored) setCartItems(JSON.parse(stored));
  }, []);

  useEffect(() => {
    localStorage.setItem('cart', JSON.stringify(cartItems));
  }, [cartItems]);

  const handleAddToCart = (productToAdd) => {
    setCartItems(prev => {
      const existingIndex = prev.findIndex(
        p =>
          p.id === productToAdd.id &&
          JSON.stringify(p.selectedAttributes) === JSON.stringify(productToAdd.selectedAttributes)
      );

      if (existingIndex > -1) {
        const updated = [...prev];
        updated[existingIndex].quantity += 1;
        return updated;
      } else {
        return [...prev, { ...productToAdd, quantity: 1 }];
      }
    });

    setCartOpen(true); 
  };

  const handleQuickShop = (product) => {
    const defaultAttributes = {};
    if (product.attributes) {
      for (let attr of product.attributes) {
        defaultAttributes[attr.name] = attr.items[0].value;
      }
    }

    const productToAdd = {
      ...product,
      selectedAttributes: defaultAttributes
    };

    handleAddToCart(productToAdd);
  };

  if (loading) return <p>Loading products...</p>;
  if (error) return <pre>{JSON.stringify(error, null, 2)}</pre>;

  return (
  <div className={`display-container ${isCartOpen ? 'dimmed' : ''}`}>
    {!selectedProduct && (
      <>
        <h1 className="page-heading">{getHeading()}</h1>
        <div className="cards-container">
          {products.map((product) => (
            <Card
              key={product.id}
              product={product}
              onClick={setSelectedProduct}
              onQuickAdd={handleQuickShop}
               dimmed={isCartOpen}  
            />
          ))}
        </div>
      </>
    )}

    {selectedProduct && (
      <ProductPage
        product={selectedProduct}
        onClose={() => setSelectedProduct(null)}
        onAddToCart={handleAddToCart}
      />
    )}

    
  </div>
);
}

export default ProductListingPage;