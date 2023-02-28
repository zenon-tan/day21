package day21.workshop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import day21.workshop.models.Customer;
import day21.workshop.models.Orders;
import day21.workshop.repo.CustomerRepo;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    @Autowired
    CustomerRepo cRepo;

    @GetMapping
    public ResponseEntity<List<Customer>> getAll
    (@RequestParam(name = "limit", required = false, defaultValue = "5") int limit,
    @RequestParam(name = "offset", required = false, defaultValue = "0") int offset) {



        return new ResponseEntity<>(cRepo.getAllCustomers(limit, offset), HttpStatus.OK);

    }

    @GetMapping("/{id}")
    public ResponseEntity<Customer> getById (@PathVariable(name = "id") int id) {

        Customer result = cRepo.getCustomerById(id);
        if(result != null) {
            return new ResponseEntity<>(result, HttpStatus.OK);
        }

        return new ResponseEntity<Customer>(HttpStatus.NO_CONTENT);
        
    }

    @GetMapping("/{id}/orders")
    public ResponseEntity<List<Orders>> getOrderById (@PathVariable(name = "id") int cust_id) {
        
        List<Orders> result = cRepo.getOrdersByCustId(cust_id);

        if(result.size() == 0){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
}
