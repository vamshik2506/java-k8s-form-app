package com.example.formapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FormController {

    @GetMapping("/")
    public String showForm(Model model) {
        model.addAttribute("user", new User());
        return "form";
    }

    @PostMapping("/submit")
    public String submitForm(@ModelAttribute User user, Model model) {
        model.addAttribute("name", user.getName());
        model.addAttribute("email", user.getEmail());
        System.out.println("Received: " + user.getName() + ", " + user.getEmail());
        return "form";
    }
}
