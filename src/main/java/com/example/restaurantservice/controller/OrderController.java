package com.example.restaurantservice.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.restaurantservice.exception.OrderNotFoundException;
import com.example.restaurantservice.model.Cart;
import com.example.restaurantservice.model.Item;
import com.example.restaurantservice.model.OrderDto;
import com.example.restaurantservice.model.Orders;
import com.example.restaurantservice.service.OrderService;

import net.bytebuddy.dynamic.DynamicType.Builder.FieldDefinition.Optional;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	/*
	@PostMapping("/order")
	public ResponseEntity<String> placeOrder(@RequestBody OrderDto orderDto){
		return orderService.placeOrder(orderDto);
		
		
	}*/
	
	@PostMapping("/order")
	public ResponseEntity<Long> placeOrder(@RequestBody OrderDto orderDto){
		boolean state = orderService.placeOrder(orderDto);
		if(state==true) {
		 return new ResponseEntity<Long>( orderDto.getCart().getCartId(), HttpStatus.PERMANENT_REDIRECT);
		}else {
		return null;
		}
		
	}
	
	@GetMapping("/order")
    public String placeOrder(@RequestParam String orderId) {
		return "SuccessOrder";
    }
	
	@GetMapping("/order/{orderId}")
	public ResponseEntity<Orders> getOrderById(@PathVariable Long orderId,ModelMap model){
		
		logger.info("calling service method to get order by id");
		java.util.Optional<Orders> order = orderService.getOrderById(orderId);
		Orders orders = new Orders();
		
		if(order.isPresent()) {
			return new ResponseEntity<Orders>(order.get(),HttpStatus.OK);
		}else {
			throw new OrderNotFoundException("OrderNotFoundException");
		}
		
	}
	
	@GetMapping("/orders")
		public ResponseEntity<List<Orders>> getOrders(){
		List<Orders> orders = orderService.getOrders();
		if(orders.isEmpty()) {
			throw new OrderNotFoundException("OrderNotFoundException");
		}else {
			return new ResponseEntity<List<Orders>>(orders,HttpStatus.OK);
		}
		
		}
	
	@PutMapping("/order/cancel/{orderId}")
	public ResponseEntity<String> cancelOrder(@PathVariable Long orderId){
		
		boolean result = orderService.cancelOrder(orderId);
		if(result) {
			return new ResponseEntity<String>("order cancelled for orderId" +orderId,HttpStatus.OK);
			
		}else {
			
			throw new OrderNotFoundException("OrderNotFoundException");
		}
		
		
	}
	
	}

