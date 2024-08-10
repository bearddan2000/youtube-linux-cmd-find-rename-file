package example.controller;

import java.util.Arrays;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DogController {

	final String title = "Dog Table";
	final String dataTable = "dogTable";
	final List<String> columnNames = Arrays.asList("Id", "Breed", "Color");

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String goHome(Model model){
		model.addAttribute("title", title);
		model.addAttribute("dataTable", dataTable);
		model.addAttribute("columnNames", columnNames);

		return "index";
	}
}
