package day21.workshop.models;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {

    private int id;
    private String company;
    private String firstName;
    private String lastName;
    private String jobTitle;
    private String address;

    private List<Orders> orderList;

    
    
}
