package com.jejutree.model;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class HomeController {

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      
      return "MainPage";

   }
   @RequestMapping(value = "MainPage.go", method = RequestMethod.GET)
   public String toMainPage() {
   
      return "MainPage";
   
   }
   @RequestMapping(value = "tmap.go", method = RequestMethod.GET)
   public String toTMAP() {
   
      return "TMAP";
   
   }
}
