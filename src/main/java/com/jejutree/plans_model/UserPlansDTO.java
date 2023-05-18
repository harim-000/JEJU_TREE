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
    private String userId;
    private String description;
    private String title;
    private String startDate;
    private String endDate;
    private String location;
    private String createdAt;
    private String updatedAt;
}