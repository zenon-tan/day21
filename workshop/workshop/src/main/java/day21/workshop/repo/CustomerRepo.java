package day21.workshop.repo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import day21.workshop.models.Customer;
import day21.workshop.models.Orders;

@Repository
public class CustomerRepo {

    @Autowired
    JdbcTemplate jdbcTemplate;

    private final String GET_ALL_CUSTOMERS_SQL = """
        select id, company, first_name, last_name, job_title, address from customers
        limit ? offset ?
            """;

    private final String GET_CUSTOMER_BY_ID_SQL = """
        select id, company, first_name, last_name, job_title, address from customers
        where id = ?
            """;

    private final String GET_ORDERS_BY_CUST_ID_SQL = """
        select
        o.id order_id, o.customer_id, o.order_date, o.shipped_date, o.ship_address 
        from customers c
        inner join orders o
        on c.id = o.customer_id
        where c.id = ?
            """;

    public List<Customer> getAllCustomers(int limit, int offset) {

        return jdbcTemplate.query(GET_ALL_CUSTOMERS_SQL, 
        new BeanPropertyRowMapper().newInstance(Customer.class), limit, offset);
        
    }

    public Customer getCustomerById(int id) {
        return jdbcTemplate.query(GET_CUSTOMER_BY_ID_SQL, 
        new BeanPropertyRowMapper().newInstance(Customer.class), id).get(0);
    }

    public List<Orders> getOrdersByCustId(int cust_id) {
        return jdbcTemplate.query(GET_ORDERS_BY_CUST_ID_SQL, 
        new BeanPropertyRowMapper().newInstance(Orders.class), cust_id);
    }


    
}
