package day21.workshop.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {

    private int orderId;
    private Date orderDate;
    private Date shippedDate;
    private String shipAddress;
    
}
