package com.springhow.examples.templatetournament;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @RequestMapping("/")
    public String order(Model model) {
        model.addAttribute("orderEntry", TournamentHelper.getOrder());
        return "order";
    }
}
