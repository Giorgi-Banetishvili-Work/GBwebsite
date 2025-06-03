
-- --------------------------------------------------------
--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `attribute_id` varchar(255) NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_type` text NOT NULL,
  `attribute_product` varchar(255) NOT NULL,
  `attribute_item` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`attribute_id`, `attribute_name`, `attribute_type`, `attribute_product`, `attribute_item`) VALUES
('Capacity', 'Capacity', 'text', 'apple-imac-2021', 'imac_capacity'),
('With USB 3 ports', 'With USB 3 ports', 'text', 'apple-imac-2021', 'imac_ports'),
('Touch ID in keyboard', 'Touch ID in keyboard', 'text', 'apple-imac-2021', 'imac_touch'),
('Capacity', 'Capacity', 'text', 'apple-iphone-12-pro', 'iphone_capacity'),
('Color', 'Color', 'Swatch', 'apple-iphone-12-pro', 'iphone_color'),
('size', 'size', 'text', 'jacket-canada-goosee', 'jacket'),
('Capacity', 'Capacity', 'text', 'ps-5', 'ps_capacity'),
('Color', 'Color', 'Swatch', 'ps-5', 'ps_color'),
('Size', 'Size', 'text', 'huarache-x-stussy-le', 'sneakers'),
('Capacity', 'Capacity', 'text', 'xbox-series-s', 'xbox_capacity'),
('Color', 'Color', 'Swatch', 'xbox-series-s', 'xbox_color');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_name`) VALUES
('all'),
('clothes'),
('tech');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `label` char(50) NOT NULL,
  `symbol` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`label`, `symbol`) VALUES
('USD', '$');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `product_image` text NOT NULL,
  `gallery_product` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `product_image`, `gallery_product`) VALUES
(1, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087', 'huarache-x-stussy-le'),
(2, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087', 'huarache-x-stussy-le'),
(3, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087', 'huarache-x-stussy-le'),
(4, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087', 'huarache-x-stussy-le'),
(5, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087', 'huarache-x-stussy-le'),
(6, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg', 'jacket-canada-goosee'),
(7, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg', 'jacket-canada-goosee'),
(8, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg', 'jacket-canada-goosee'),
(9, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg', 'jacket-canada-goosee'),
(10, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg', 'jacket-canada-goosee'),
(11, 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png', 'jacket-canada-goosee'),
(12, 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png', 'jacket-canada-goosee'),
(13, 'https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg', 'ps-5'),
(14, 'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg', 'ps-5'),
(15, 'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg', 'ps-5'),
(16, 'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg', 'ps-5'),
(17, 'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg', 'ps-5'),
(18, 'https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg', 'xbox-series-s'),
(19, 'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg', 'xbox-series-s'),
(20, 'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg', 'xbox-series-s'),
(21, 'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg', 'xbox-series-s'),
(22, 'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg', 'xbox-series-s'),
(23, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000', 'apple-imac-2021'),
(24, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;.v=1604021663000', 'apple-iphone-12-pro'),
(25, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000', 'apple-airpods-pro'),
(26, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000', 'apple-airtag');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_main_id` int(11) NOT NULL,
  `item_displayValue` varchar(255) NOT NULL,
  `item_value` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_attributes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_main_id`, `item_displayValue`, `item_value`, `item_id`, `item_attributes`) VALUES
(1, '40', '40', '40', 'sneakers'),
(2, '41', '41', '41', 'sneakers'),
(3, '42', '42', '42', 'sneakers'),
(4, '43', '43', '43', 'sneakers'),
(5, 'Small', 'S', 'Small', 'jacket'),
(6, 'Medium', 'M', 'Medium', 'jacket'),
(7, 'Large', 'L', 'Large', 'jacket'),
(8, 'Extra Large', 'XL', 'Extra Large', 'jacket'),
(9, 'Green', '#44FF03', 'Green', 'ps_color'),
(10, 'Cyan', '#03FFF7', 'Cyan', 'ps_color'),
(11, 'Blue', '#030BFF', 'Blue', 'ps_color'),
(12, 'Black', '#000000', 'Black', 'ps_color'),
(13, 'White', '#FFFFFF', 'White', 'ps_color'),
(14, '512G', '512G', '512G', 'ps_capacity'),
(15, '1T', '1T', '1T', 'ps_capacity'),
(16, 'Green', '#44FF03', 'Green', 'xbox_color'),
(17, 'Cyan', '#03FFF7', 'Cyan', 'xbox_color'),
(18, 'Blue', '#030BFF', 'Blue', 'xbox_color'),
(19, 'Black', '#000000', 'Black', 'xbox_color'),
(20, 'White', '#FFFFFF', 'White', 'xbox_color'),
(21, '512GB', '512GB', '512GB', 'xbox_capacity'),
(22, '1T', '1T', '1T', 'xbox_capacity'),
(23, '256GB', '256GB', '256GB', 'imac_capacity'),
(24, '512GB', '512GB', '512GB', 'imac_capacity'),
(25, 'Yes', 'Yes', 'Yes', 'imac_ports'),
(26, 'No', 'No', 'No', 'imac_ports'),
(27, 'Yes', 'Yes', 'Yes', 'imac_touch'),
(28, 'No', 'No', 'No', 'imac_touch'),
(29, 'Green', '#44FF03', 'Green', 'iphone_color'),
(30, 'Cyan', '#03FFF7', 'Cyan', 'iphone_color'),
(31, 'Blue', '#030BFF', 'Blue', 'iphone_color'),
(32, 'Black', '#000000', 'Black', 'iphone_color'),
(33, 'White', '#FFFFFF', 'White', 'iphone_color'),
(34, '512GB', '512GB', '512GB', 'iphone_capacity'),
(35, '1T', '1T', '1T', 'iphone_capacity');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total_price`, `created_at`) VALUES
(32, '120.57', '2025-05-11 11:50:57'),
(33, '6908.87', '2025-05-11 11:51:20'),
(34, '4039.21', '2025-05-11 11:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `attributes`) VALUES
(59, 32, 'apple-airtag', 'AirTag', 1, '120.57', '{}'),
(60, 33, 'apple-imac-2021', 'iMac 2021', 3, '1688.03', '{\"Capacity\":\"256GB\",\"With USB 3 ports\":\"No\",\"Touch ID in keyboard\":\"Yes\"}'),
(61, 33, 'apple-iphone-12-pro', 'iPhone 12 Pro', 1, '1000.76', '{\"Color\":\"#030BFF\",\"Capacity\":\"1T\"}'),
(62, 33, 'ps-5', 'PlayStation 5', 1, '844.02', '{\"Capacity\":\"1T\",\"Color\":\"#FFFFFF\"}'),
(63, 34, 'ps-5', 'PlayStation 5', 1, '844.02', '{\"Capacity\":\"512G\",\"Color\":\"#44FF03\"}'),
(64, 34, 'apple-iphone-12-pro', 'iPhone 12 Pro', 1, '1000.76', '{\"Capacity\":\"512GB\",\"Color\":\"#44FF03\"}'),
(65, 34, 'huarache-x-stussy-le', 'Nike Air Huarache Le', 1, '144.69', '{\"Size\":\"41\"}'),
(66, 34, 'apple-imac-2021', 'iMac 2021', 1, '1688.03', '{\"Capacity\":\"512GB\",\"With USB 3 ports\":\"No\",\"Touch ID in keyboard\":\"No\"}'),
(67, 34, 'apple-airtag', 'AirTag', 3, '120.57', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `price_id` int(11) NOT NULL,
  `prices_product` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `prices_currency` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`price_id`, `prices_product`, `amount`, `prices_currency`) VALUES
(1, 'huarache-x-stussy-le', '144.69', 'USD'),
(2, 'jacket-canada-goosee', '518.47', 'USD'),
(3, 'ps-5', '844.02', 'USD'),
(4, 'xbox-series-s', '333.99', 'USD'),
(5, 'apple-imac-2021', '1688.03', 'USD'),
(6, 'apple-iphone-12-pro', '1000.76', 'USD'),
(7, 'apple-airpods-pro', '300.23', 'USD'),
(8, 'apple-airtag', '120.57', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_inStock` tinyint(1) NOT NULL,
  `product_description` text NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_brand` varchar(255) NOT NULL,
  `product_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_inStock`, `product_description`, `product_category`, `product_brand`, `product_type_all`, `product_slug`) VALUES
('apple-airpods-pro', 'AirPods Pro', 0, 'Magic like you’ve never heard AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sound, Transparency mode so you can hear your surroundings, and a customizable fit for all-day comfort. Just like AirPods, AirPods Pro connect magically to your iPhone or Apple Watch. And they’re ready to use right out of the case. Active Noise Cancellation Incredibly light noise-cancelling headphones, AirPods Pro block out your environment so you can focus on what you’re listening to. AirPods Pro use two microphones, an outward-facing microphone and an inward-facing microphone, to create superior noise cancellation. By continuously adapting to the geometry of your ear and the fit of the ear tips, Active Noise Cancellation silences the world to keep you fully tuned in to your music, podcasts, and calls. Transparency mode Switch to Transparency mode and AirPods Pro let the outside sound in, allowing you to hear and connect to your surroundings. Outward- and inward-facing microphones enable AirPods Pro to undo the sound-isolating effect of the silicone tips so things sound and feel natural, like when you’re talking to people around you. All-new design AirPods Pro offer a more customizable fit with three sizes of flexible silicone tips to choose from. With an internal taper, they conform to the shape of your ear, securing your AirPods Pro in place and creating an exceptional seal for superior noise cancellation. Amazing audio quality A custom-built high-excursion, low-distortion driver delivers powerful bass. A superefficient high dynamic range amplifier produces pure, incredibly clear sound while also extending battery life. And Adaptive EQ automatically tunes music to suit the shape of your ear for a rich, consistent listening experience. Even more magical The Apple-designed H1 chip delivers incredibly low audio latency. A force sensor on the stem makes it easy to control music and calls and switch between Active Noise Cancellation and Transparency mode. Announce Messages with Siri gives you the option to have Siri read your messages through your AirPods. And with Audio Sharing, you and a friend can share the same audio stream on two sets of AirPods — so you can play a game, watch a movie, or listen to a song together.', 'tech', 'Apple', 'all', 'apple-airpods-pro'),
('apple-airtag', 'AirTag', 1, 'Lose your knack for losing things. AirTag is an easy way to keep track of your stuff. Attach one to your keys, slip another one in your backpack. And just like that, they’re on your radar in the Find My app. AirTag has your back.', 'tech', 'Apple', 'all', 'apple-airtag'),
('apple-imac-2021', 'iMac 2021', 1, 'The new iMac!', 'tech', 'Apple', 'all', 'apple-imac-2021'),
('apple-iphone-12-pro', 'iPhone 12 Pro', 1, 'This is iPhone 12. Nothing else to say.', 'tech', 'Apple', 'all', 'apple-iphone-12-pro'),
('huarache-x-stussy-le', 'Nike Air Huarache Le', 1, 'Great sneakers for everyday use!', 'clothes', 'Nike x Stussy', 'all', 'huarache-x-stussy-le'),
('jacket-canada-goosee', 'Jacket', 1, 'Awesome winter jacket', 'clothes', 'Canada Goose', 'all', 'jacket-canada-goosee'),
('ps-5', 'PlayStation 5', 1, 'A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha', 'tech', 'Sony', 'all', 'ps-5'),
('xbox-series-s', 'Xbox Series S 512GB', 0, 'Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer Spiele Games mit bis zu 120 Bilder pro Sekunde      Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen. Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter. Deine Fortschritte, Erfolge und Freundesliste werden automatisch auf das neue System übertragen. Erwecke deine Spiele und Filme mit innovativem 3D Raumklang zum Leben Der brandneue Xbox Wireless Controller zeichnet sich durch höchste Präzision, eine neue Share-Taste und verbesserte Ergonomie aus Ultra-niedrige Latenz verbessert die Reaktionszeit von Controller zum Fernseher Verwende dein Xbox One-Gaming-Zubehör -einschließlich Controller, Headsets und mehr Erweitere deinen Speicher mit der Seagate 1 TB-Erweiterungskarte für Xbox Series X (separat erhältlich) und streame 4K-Videos von Disney+, Netflix, Amazon, Microsoft Movies &amp; TV und mehr.', 'tech', 'Microsoft', 'all', 'xbox-series-s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`attribute_item`),
  ADD KEY `attribute_product` (`attribute_product`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_name`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`label`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `product_id` (`gallery_product`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_main_id`),
  ADD KEY `items_ibfk_1` (`item_attributes`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `price_product` (`prices_product`),
  ADD KEY `prices_currency` (`prices_currency`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_slug` (`product_slug`),
  ADD KEY `product_type_all` (`product_type_all`),
  ADD KEY `product_category` (`product_category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_main_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`attribute_product`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`gallery_product`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_attributes`) REFERENCES `attributes` (`attribute_item`);

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`prices_product`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`prices_currency`) REFERENCES `currency` (`label`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_all`) REFERENCES `categories` (`category_name`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`product_category`) REFERENCES `categories` (`category_name`);
COMMIT;

