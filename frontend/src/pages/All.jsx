import ProductListingPage from "../components/ProductListingPage";

function All({ cartItems, setCartItems, isCartOpen, setCartOpen }) {
  return (
    <ProductListingPage
      cartItems={cartItems}
      setCartItems={setCartItems}
      isCartOpen={isCartOpen}
      setCartOpen={setCartOpen}
    />
  );
}

export default All;