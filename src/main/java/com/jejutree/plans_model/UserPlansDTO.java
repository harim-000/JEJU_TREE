package com.jejutree.plans_model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserPlansDTO {
    private int id;
    private String user_id;
    private int travel_plan_id;
    private Date start_date;
    private Date end_date;
    private String notes;
    private Date created_at;
    private Date updated_at;

}
