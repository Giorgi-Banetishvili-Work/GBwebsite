import ProductListingPage from "../components/ProductListingPage";

function Clothes({ cartItems, setCartItems, isCartOpen, setCartOpen }) {
  return (
    <ProductListingPage
      cartItems={cartItems}
      setCartItems={setCartItems}
      isCartOpen={isCartOpen}
      setCartOpen={setCartOpen}
    />
  );
}

export default Clothes;