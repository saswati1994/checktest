package com.example.restaurantservice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.restaurantservice.model.Cart;
import com.example.restaurantservice.model.Item;
import com.example.restaurantservice.model.Orders;
import com.example.restaurantservice.repository.CartRepository;
import com.example.restaurantservice.repository.ItemRepository;
import com.example.restaurantservice.repository.OrderRepository;

@Controller
public class TestController {


	  @Autowired
	  private CartRepository cartRepository;
	  
	  @Autowired
	  private ItemRepository itemRepository;
	  
	  @Autowired
	  OrderRepository orderRepository;
	  
	  @PostMapping("/item")
	  public void addItem(@RequestBody Item item) {
		  itemRepository.save(item);
	  }

	  @PostMapping("/carts")
	  public void createCart(@RequestBody Cart cart){

	    cartRepository.save(cart);

	  }

/*
	  @GetMapping("/cart")
	  public ResponseEntity<List<Cart>> getAllCarts(){

	    return  new ResponseEntity(cartRepository.findAll(), HttpStatus.OK);

	  }*/
	  @GetMapping("/cart")
	  public String getAllCarts(){
		  

	    return  "ViewCart";

	  }
	  @GetMapping("/cart/{cartId}")
	  public String getCartItemById(@PathVariable Long cartId,ModelMap model) {
		  Cart cart =new Cart();
		 // Item item =new Item();
		  Long totalPrice =0L;
		  List<Item> items = new ArrayList<Item>();
		 Optional<Cart> cartOptions = cartRepository.findById(cartId);
		 if(cartOptions.isPresent()) {
			  cart = cartOptions.get();
			 
					 items=  cart.getItems();
		 }else {
			 
		 }
		 for(Item item:items) {
			 Long price = item.getPrice();
			 totalPrice =totalPrice+ price;
		 }
		 model.put("totalPrice", totalPrice);
		 model.put("cartitems", cart);
		 model.put("items", items);
		return "checkout";
		  
	  }
	  
	 /* @GetMapping("/order")
	  public ResponseEntity<List<Cart>> getAllOrders(){

	    return  new ResponseEntity(orderRepository.findAll(), HttpStatus.OK);

	  }

	  @PostMapping("/order")
	  public void placeOrders(@RequestBody Orders orders){

	     orderRepository.save(orders);

	  }*/
}
